#pragma once

#include <openssl/evp.h>
#include <vector>
#include <string>

class DigestException : public std::exception {};

// Wrapper class for the OpenSSL sha512 digest algorithm.
// This works just like the OpenSSL functions. Start by calling init(), then 
// call update() as many times as you need to add data, and get the digest with result().
// Any of these functions may raise DigestException.
class Digest {
public:
  Digest();
  virtual ~Digest();

  void init();
  void update(std::string data);
  std::vector<unsigned char> result();

private:
  EVP_MD_CTX *ctx;
};

