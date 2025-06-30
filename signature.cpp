#include "signature.h"

#include <Poco/URI.h>
#include <Poco/JSON/Object.h>
#include <Poco/Net/HTMLForm.h>
#include <Poco/StreamCopier.h>

using namespace Poco::Net;
using namespace Poco::JSON;
using namespace Poco;

void SignatureHandler::handleRequest(HTTPServerRequest &request, HTTPServerResponse &response) {
  Object::Ptr json = new Object;
  if (request.getMethod() == HTTPRequest::HTTP_POST) {
    SignaturePartHandler handler;
    HTMLForm form(request, request.stream(), handler);

#if 0
    {
      std::cout << "printing document:" << std::endl;
      for (unsigned char c : handler.document) {
        std::cout << c;
      }
      std::cout << std::endl;
    }

    {
      std::cout << "printing certification:" << std::endl;
      for (unsigned char c : handler.certification) {
        std::cout << c;
      }
      std::cout << std::endl;
    }
#endif

    std::cout << " - done: " << handler.i << std::endl;
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
      std::string password = ss.str();

      std::cout << "password: " << password << std::endl;

    }
  }

}
