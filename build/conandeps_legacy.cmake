message(STATUS "Conan: Using CMakeDeps conandeps_legacy.cmake aggregator via include()")
message(STATUS "Conan: It is recommended to use explicit find_package() per dependency instead")

find_package(Poco)
find_package(Catch2)
find_package(OpenSSL)
find_package(ZLIB)

set(CONANDEPS_LEGACY  Poco::Poco  Catch2::Catch2WithMain  openssl::openssl  ZLIB::ZLIB )