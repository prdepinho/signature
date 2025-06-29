message(STATUS "Conan: Using CMakeDeps conandeps_legacy.cmake aggregator via include()")
message(STATUS "Conan: It is recommended to use explicit find_package() per dependency instead")

find_package(Poco)
find_package(ZLIB)
find_package(Catch2)

set(CONANDEPS_LEGACY  Poco::Poco  ZLIB::ZLIB  Catch2::Catch2WithMain )