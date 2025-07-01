#include "verify.h"

#include <Poco/URI.h>
#include <Poco/JSON/Object.h>

#include <openssl/cms.h>
#include <openssl/pem.h>
#include <openssl/err.h>

using namespace Poco::Net;
using namespace Poco::JSON;
using namespace Poco;

void VerifyHandler::handleRequest(HTTPServerRequest &request, HTTPServerResponse &response) {
  Object::Ptr json = new Object;
  if (request.getMethod() == HTTPRequest::HTTP_GET) {

  }
  else {
    std::cout << "Method not allowed" << std::endl;
    response.setStatus(HTTPResponse::HTTP_METHOD_NOT_ALLOWED);
  }
  response.setContentType("application/json");
  std::ostream &out = response.send();
  json->stringify(out);
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
