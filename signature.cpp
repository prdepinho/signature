#include "signature.h"

#include <Poco/URI.h>
#include <Poco/JSON/Object.h>
#include <Poco/Net/HTMLForm.h>
#include <Poco/StreamCopier.h>
#include <Poco/Base64Encoder.h>

#include <openssl/pkcs12.h>
#include <openssl/cms.h>
#include <openssl/pem.h>
#include <openssl/err.h>

using namespace Poco::Net;
using namespace Poco::JSON;
using namespace Poco;

void SignatureHandler::handleRequest(HTTPServerRequest &request, HTTPServerResponse &response) {
  Object::Ptr json = new Object;
  if (request.getMethod() == HTTPRequest::HTTP_POST) {
    SignaturePartHandler handler;
    HTMLForm form(request, request.stream(), handler);

    // sign
    std::vector<unsigned char> p7s = Signature::sign(
        handler.document, handler.certification, handler.password);

    std::cout << " - done: " << handler.i << std::endl;
    std::cout << "size: " << p7s.size() << std::endl;

    // transform into base64
    std::string pem;
    {
      std::ostringstream ss;
      Base64Encoder encoder(ss);
      encoder.write(
          reinterpret_cast<const char*>(p7s.data()),
          static_cast<std::streamsize>(p7s.size()));
      encoder.close();
      pem = ss.str();
    }

    std::cout << "Base64: " << pem << std::endl;

    json->set("pem", pem);
    response.setStatus(HTTPResponse::HTTP_OK);
  }
  else {
    std::cout << "Method not allowed" << std::endl;
    response.setStatus(HTTPResponse::HTTP_METHOD_NOT_ALLOWED);
  }
  response.setContentType("application/json");
  std::ostream &out = response.send();
  json->stringify(out);
}


void SignaturePartHandler::handlePart(const MessageHeader &header, std::istream &stream) {
  NameValueCollection params;
  std::string value;
  std::cout << "-------------------------" << std::endl;

  std::cout << header["Content-Disposition"] << std::endl;

  MessageHeader::splitParameters(header["Content-Disposition"], value, params);

  std::cout << "Value: " << value << std::endl;

  std::string filename = params.get("filename", "");
  std::string name = params.get("name", "");
  std::string content_type = header.get("Content-Type", "");

  std::cout << "Name: " << name << std::endl;
  std::cout << "Content-Type: " << content_type << std::endl;
  std::cout << "Filename: " << filename << std::endl;
  this->i += 1;

  if (!filename.empty()) {
    if (name == "document") {
      std::ostringstream ss(std::ios::binary);
      StreamCopier::copyStream(stream, ss);

      std::string data = ss.str();
      this->document = std::vector<unsigned char>(data.begin(), data.end());

      std::cout << "copied document: " << this->document.size() << std::endl;
    }
    else if (name == "certification") {
      std::ostringstream ss(std::ios::binary);
      StreamCopier::copyStream(stream, ss);

      std::string data = ss.str();
      this->certification = std::vector<unsigned char>(data.begin(), data.end());
      
      std::cout << "copied certification: " << this->certification.size() << std::endl;
    }
    else if (name == "metadata") {
      std::ostringstream ss;
      StreamCopier::copyStream(stream, ss);
      this->password = ss.str();
      std::cout << "password: " << this->password << std::endl;

    }
  }

}

std::vector<unsigned char> Signature::sign(
    std::vector<unsigned char> in,
    std::vector<unsigned char> pfx,
    std::string password) {

  OpenSSL_add_all_algorithms();
  ERR_load_crypto_strings();

  int rval;
  std::vector<unsigned char> out;

  EVP_PKEY *pkey = NULL;
  X509 *cert = NULL;
  STACK_OF(X509) *ca = NULL;

  // get private key and certification
  {
    BIO *bio = BIO_new_mem_buf(pfx.data(), static_cast<int>(pfx.size()));
    PKCS12 *pkcs12 = d2i_PKCS12_bio(bio, NULL);
    BIO_free(bio);

    if (pkcs12 == NULL) {
      throw SignatureException();
    }

    rval = PKCS12_parse(pkcs12, password.c_str(), &pkey, &cert, &ca);
    PKCS12_free(pkcs12);

    if (!rval) {
      throw SignatureException();
    }
  }

  // make the signature
  {
    BIO *bio = BIO_new_mem_buf(in.data(), static_cast<int>(in.size()));
    CMS_ContentInfo *cms = CMS_sign(cert, pkey, ca, bio, CMS_BINARY);
    BIO_free(bio);
    if (cms == NULL) {
      throw SignatureException();
    }

    // obtain signature data to output
    bio = BIO_new(BIO_s_mem());
    rval = i2d_CMS_bio(bio, cms);
    if (!rval) {
      CMS_ContentInfo_free(cms);
      BIO_free(bio);
      throw SignatureException();
    }
    BUF_MEM *bptr = NULL;
    BIO_get_mem_ptr(bio, &bptr);

    out.assign(bptr->data, bptr->data + bptr->length);

    CMS_ContentInfo_free(cms);
    BIO_free(bio);
  }

  EVP_PKEY_free(pkey);
  X509_free(cert);
  sk_X509_pop_free(ca, X509_free);

  return out;
}
