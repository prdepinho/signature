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
  friend class SignatureHandler;
public:
  void handlePart(
      const Poco::Net::MessageHeader &header,
      std::istream &stream) override;

private:
  std::vector<unsigned char> document;
  std::vector<unsigned char> certificate;
  std::string password;

};


class SignatureException : public std::exception {};

// Makes a digital signature.
// - in: is the document you need to sign.
// - pfx: is the certificate
// - password: is the password for the certificate
// - returns: the signed p7s document in DER format.
// - throws SignatureException
namespace Signature {
  std::vector<unsigned char> sign(
      std::vector<unsigned char> in,
      std::vector<unsigned char> pfx,
      std::string password);

}
