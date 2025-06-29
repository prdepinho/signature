cmake_minimum_required(VERSION 4.0.3)
project(Signature)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

find_package(Poco REQUIRED COMPONENTS Foundation Crypto Net JSON CONFIG)
find_package(ZLIB REQUIRED)
find_package(OpenSSL REQUIRED)
add_executable(signature main.cpp signature.cpp verify.cpp digest.cpp fibonacci.cpp)
target_link_libraries(signature Poco::Foundation Poco::Crypto Poco::Net Poco::JSON openssl::openssl ZLIB::ZLIB)

find_package(Catch2 REQUIRED)
add_executable(test test.cpp signature.cpp verify.cpp digest.cpp fibonacci.cpp)
target_link_libraries(test Catch2::Catch2WithMain Poco::Foundation Poco::Crypto Poco::Net Poco::JSON openssl::openssl ZLIB::ZLIB)
