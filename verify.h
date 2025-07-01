#pragma once

#include <Poco/Net/HTTPRequestHandler.h>
#include <Poco/Net/HTTPServerRequest.h>
#include <Poco/Net/HTTPServerResponse.h>
#include <Poco/Net/PartHandler.h>
#include <vector>

class VerifyHandler : public Poco::Net::HTTPRequestHandler {
public:
    void handleRequest(
        Poco::Net::HTTPServerRequest &request,
        Poco::Net::HTTPServerResponse &response) override;
};

class VerifyPartHandler : public Poco::Net::PartHandler {
  friend class VerifyHandler;
public:
  void handlePart(
      const Poco::Net::MessageHeader &header,
      std::istream &stream) override;

private:
  std::vector<unsigned char> p7s;

};


class VerifyException : public std::exception {};

// Makes a digital signature.
// - p7s: the signed p7s document in DER format.
// - out: is the original document
// - returns: a boolean, whether the document is valid or not
// - throws VerifyException
namespace Verify {
  bool verify(
      std::vector<unsigned char> p7s,
      std::vector<unsigned char> &out);
}
