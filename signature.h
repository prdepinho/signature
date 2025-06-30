#pragma once

#include <Poco/Net/HTTPRequestHandler.h>
#include <Poco/Net/HTTPServerRequest.h>
#include <Poco/Net/HTTPServerResponse.h>
#include <Poco/Net/PartHandler.h>
#include <vector>

class SignatureHandler : public Poco::Net::HTTPRequestHandler {
public:
  void handleRequest(
    Poco::Net::HTTPServerRequest &request,
    Poco::Net::HTTPServerResponse &response) override;
};


class SignaturePartHandler : public Poco::Net::PartHandler {
public:
  void handlePart(
      const Poco::Net::MessageHeader &header,
      std::istream &stream) override;

  int i = 0;
  std::vector<unsigned char> document;
  std::vector<unsigned char> certification;

};
