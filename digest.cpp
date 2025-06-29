#include "digest.h"

Digest::Digest() : ctx(NULL) {}

Digest::~Digest() {
  if (this->ctx != NULL) {
    EVP_MD_CTX_free(this->ctx);
  }
}

void Digest::init() {
  int rval;

  const EVP_MD *md = EVP_sha512();

  this->ctx = EVP_MD_CTX_new();
  if (this->ctx == NULL) {
    throw DigestException();
  }
  
  rval = EVP_DigestInit_ex2(this->ctx, md, NULL);
  if (!rval) {
    throw DigestException();
  }

}

void Digest::update(std::string data) {
  int rval;

  rval = EVP_DigestUpdate(this->ctx, data.c_str(), data.size());
  if (!rval) {
    throw DigestException();
  }
}


std::vector<unsigned char> Digest::result() {
  int rval;

  unsigned char result[EVP_MAX_MD_SIZE];
  unsigned int length;

  rval = EVP_DigestFinal_ex(this->ctx, result, &length);
  if (!rval) {
    throw DigestException();
  }

  return std::vector<unsigned char>(result, result + length);
}
