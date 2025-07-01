#include "verify.h"

#include <Poco/URI.h>
#include <Poco/JSON/Object.h>
#include <Poco/Net/HTMLForm.h>
#include <Poco/StreamCopier.h>

#include <openssl/cms.h>
#include <openssl/pem.h>
#include <openssl/err.h>

using namespace Poco::Net;
using namespace Poco::JSON;
using namespace Poco;

void VerifyHandler::handleRequest(HTTPServerRequest &request, HTTPServerResponse &response) {
  Object::Ptr json = new Object;
  json->set("ok", true);

  if (request.getMethod() == HTTPRequest::HTTP_POST) {

    try {
      VerifyPartHandler handler;
      HTMLForm form(request, request.stream(), handler);

      // verify
      std::vector<unsigned char> document;
      bool valid = Verify::verify(handler.p7s, document);

      json->set("valid", valid);
      response.setStatus(HTTPResponse::HTTP_OK);
    }
    catch (const VerifyException &ex) {
      json->set("ok", false);
      response.setStatus(HTTPResponse::HTTP_BAD_REQUEST);
    }

  }
  else {
    std::cout << "Method not allowed" << std::endl;
    json->set("ok", false);
    response.setStatus(HTTPResponse::HTTP_METHOD_NOT_ALLOWED);
  }
  response.setContentType("application/json");
  std::ostream &out = response.send();
  json->stringify(out);
}

void VerifyPartHandler::handlePart(const MessageHeader &header, std::istream &stream) {
  NameValueCollection params;
  std::string value;

  MessageHeader::splitParameters(header["Content-Disposition"], value, params);

  std::string filename = params.get("filename", "");
  std::string name = params.get("name", "");
  std::string content_type = header.get("Content-Type", "");

  if (!filename.empty()) {
    if (name == "p7s") {
      std::ostringstream ss(std::ios::binary);
      StreamCopier::copyStream(stream, ss);

      std::string data = ss.str();
      this->p7s = std::vector<unsigned char>(data.begin(), data.end());
    }
  }

}


bool Verify::verify(
      std::vector<unsigned char> p7s,
      std::vector<unsigned char> &out) {

  bool valid;

  OpenSSL_add_all_algorithms();
  ERR_load_crypto_strings();

  // load p7s
  BIO *bio = BIO_new_mem_buf(p7s.data(), static_cast<int>(p7s.size()));
  CMS_ContentInfo *cms = d2i_CMS_bio(bio, NULL);
  BIO_free(bio);
  if (cms == NULL) {
    throw VerifyException();
  }

  // verify
  bio = BIO_new(BIO_s_mem());
  valid = CMS_verify(cms, NULL, NULL, NULL, bio,
      CMS_BINARY
      | CMS_NO_SIGNER_CERT_VERIFY
      // | CMS_NO_ATTR_VERIFY
      // | CMS_NO_CONTENT_VERIFY
      );

  if (valid) {
    // extract document
    BUF_MEM *bptr = NULL;
    BIO_get_mem_ptr(bio, &bptr);
    out.assign(bptr->data, bptr->data + bptr->length);
  }
  CMS_ContentInfo_free(cms);
  BIO_free(bio);

  return valid;
}
