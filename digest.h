#pragma once

#include <openssl/evp.h>
#include <vector>
#include <string>

class DigestException : public std::exception {};

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

