#include <catch2/catch_test_macros.hpp>

#include <iostream>
#include <iomanip>
#include <fstream>
#include <sstream>

#include "fibonacci.h"
#include "digest.h"


TEST_CASE("test fibonacci function") {
  REQUIRE(0 == fibonacci(0));
  REQUIRE(1 == fibonacci(1));
  REQUIRE(1 == fibonacci(2));
  REQUIRE(2 == fibonacci(3));
  REQUIRE(3 == fibonacci(4));
  REQUIRE(5 == fibonacci(5));
  REQUIRE(8 == fibonacci(6));
  REQUIRE(13 == fibonacci(7));
  REQUIRE(21 == fibonacci(8));
  REQUIRE(34 == fibonacci(9));
}

TEST_CASE("SHA512 digest") {

  std::string input;
  {
    std::ifstream file("resources/arquivos/doc.txt");
    REQUIRE(file.is_open());

    std::ostringstream ss;
    ss << file.rdbuf();
    input = ss.str();

    file.close();
  }

  std::string result;
  {
    Digest digest;
    digest.init();
    digest.update(input);
    std::vector<unsigned char> bytes = digest.result();

    std::ostringstream ss;
    for (unsigned char c : bytes) {
      ss << std::hex << std::setw(2) << std::setfill('0') << (int)c;
    }
    result = ss.str();
  }

  std::string expected = "dc1a7de77c59a29f366a4b154b03ad7d99013e36e08beb50d976358bea7b045884fe72111b27cf7d6302916b2691ac7696c1637e1ab44584d8d6613825149e35";
  // obtained with # openssl dgst -sha512 resources/arquivos/doc.txt 

  REQUIRE(result == expected);
}

TEST_CASE("test case for testing cases") {
  REQUIRE(1 == 1);
}

TEST_CASE("more testing cases") {
  REQUIRE(1 == 1);
}
