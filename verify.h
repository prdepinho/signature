#pragma once

#include <Poco/Net/HTTPRequestHandler.h>
#include <Poco/Net/HTTPServerRequest.h>
#include <Poco/Net/HTTPServerResponse.h>
#include <vector>

class VerifyHandler : public Poco::Net::HTTPRequestHandler {
public:
    void handleRequest(
        Poco::Net::HTTPServerRequest &request,
        Poco::Net::HTTPServerResponse &response) override;
};

class VerifyException : public std::exception {};

namespace Verify {
  bool verify(
      std::vector<unsigned char> p7s,
      std::vector<unsigned char> &out);
}
