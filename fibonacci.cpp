#include "fibonacci.h"

#include "Poco/URI.h"
#include "Poco/JSON/Object.h"

using namespace Poco::Net;
using namespace Poco::JSON;
using namespace Poco;

void FibHandler::handleRequest(HTTPServerRequest &request, HTTPServerResponse &response) {
  Object::Ptr json = new Object;
  if (request.getMethod() == HTTPRequest::HTTP_GET) {

    try {
      Poco::URI uri(request.getURI());
      Poco::URI::QueryParameters params = uri.getQueryParameters();

      std::string si = "0";
      for (const auto &[key, value] : params) {
        if (key == "i") {
          si = value;
        }
      }
      Poco::UInt64 i = Poco::NumberParser::parseUnsigned64(si);

      Poco::UInt64 resp = fibonacci(i);
      std::cout << "Fibonacci(" << i << ") = " << resp << std::endl;
      response.setStatus(HTTPResponse::HTTP_OK);
      json->set("response", std::to_string(resp));
    }
    catch (const Poco::SyntaxException &e) {
      std::cout << e.what() << std::endl;
      response.setStatus(HTTPResponse::HTTP_BAD_REQUEST);
    }
  }
  else {
    std::cout << "Method not allowed" << std::endl;
    response.setStatus(HTTPResponse::HTTP_METHOD_NOT_ALLOWED);
  }
  response.setContentType("application/json");
  std::ostream &out = response.send();
  json->stringify(out);
}

Poco::UInt64 fibonacci(Poco::UInt64 i) {
    return i <= 1 ? i : fibonacci(i - 1) + fibonacci(i - 2);
}

