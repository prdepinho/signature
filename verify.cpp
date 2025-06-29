#include "verify.h"

#include <Poco/URI.h>
#include <Poco/JSON/Object.h>

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

