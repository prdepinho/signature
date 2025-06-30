
#include <iostream>
#include <vector>
#include <zlib.h>

#include "signature.h"
#include "verify.h"
#include "fibonacci.h"

#include <Poco/MD5Engine.h>
#include <Poco/DigestStream.h>

#include <Poco/URI.h>
#include <Poco/Net/HTTPServer.h>
#include <Poco/Net/HTTPRequestHandler.h>
#include <Poco/Net/HTTPRequestHandlerFactory.h>
#include <Poco/Net/HTTPServerRequest.h>
#include <Poco/Net/HTTPServerResponse.h>
#include <Poco/Net/ServerSocket.h>
#include <Poco/JSON/Object.h>

/*
Install libraries and refresh cmake files:
  conan install . --output-folder=build --build=missing
  cd build
  cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release

Build the binaries:
  cmake --build . --config Release
  ./release/signature.exe
or  
  cmake --build . --config Release && ./Release/signature.exe
or
  cmake --build . --config Release && ./Release/test.exe
or
  cmake --build . --config Release && ./Release/test.exe && ./Release/signature.exe

Test the functions:
  curl -X GET "127.0.0.1:8080/fib?i=8" -H "Content-Type: application/json"
  curl -X POST 127.0.0.1:8080/foo -H "Content-Type: application/json" -d '{"spam": 10}'

Test /signature
  curl -X POST "127.0.0.1:8080/signature" -F "metadata=bry123456;filename=metadata.txt" -F "document=@build/resources/arquivos/doc.txt" -F "certification=@build/resources/pkcs12/certificado_teste_hub.pfx"
 */



using namespace Poco::Net;
using namespace Poco::JSON;
using namespace Poco;

class ServerHandler : public HTTPRequestHandler {
public:
    void handleRequest(HTTPServerRequest &request, HTTPServerResponse &response) override {
        if (request.getMethod() == HTTPRequest::HTTP_GET) {
            std::cout << "Get" << std::endl;
            response.setStatus(HTTPResponse::HTTP_OK);

        } else if (request.getMethod() == HTTPRequest::HTTP_POST) {
            std::cout << "Post" << std::endl;
            response.setStatus(HTTPResponse::HTTP_OK);

        } else {
            std::cout << "Method not allowed" << std::endl;
            response.setStatus(HTTPResponse::HTTP_METHOD_NOT_ALLOWED);
        }

        response.setContentType("application/json");

        Object::Ptr json = new Object;
        json->set("message", "Hello world Poco Loco");

        std::ostream &out = response.send();
        json->stringify(out);
    }
};

class ServerFactory : public HTTPRequestHandlerFactory {
public:
    HTTPRequestHandler *createRequestHandler(const HTTPServerRequest &request) override {
        std::string uri = request.getURI();
        std::cout << "request uri: " << uri << std::endl;
        if (uri == "/foo") {
            return new ServerHandler;
        }
        else if (uri == "/fib") {
            return new FibHandler;
        }
        else if (uri == "/signature") {
            return new SignatureHandler;
        }
        else if (uri == "/verify") {
            return new VerifyHandler;
        }
        else if (uri.compare(0, std::string("/fib").size(), "/fib") == 0) {
            return new FibHandler;
        }
        return nullptr;
    }
};


int main(void) {
    ///////////////////////////////
    z_stream defstream;

    Poco::MD5Engine md5;
    Poco::DigestOutputStream ds(md5);

    ds << "foobarspameggs";
    ds.close();

    std::cout << "Digest: " << Poco::DigestEngine::digestToHex(md5.digest()) << std::endl;

    ///////////////////////////////

    std::vector<int> ints = { 1, 1, 2, 3, 5, 8, 13, 21, 34 };

    for (int i: ints) {
        std::cout << "Hello world: " << i << std::endl;
    }
    ///////////////////////////////

    HTTPRequestHandlerFactory::Ptr factory = new ServerFactory;
    HTTPServerParams::Ptr params = new HTTPServerParams;

    HTTPServer server(factory, ServerSocket(8080), params);
    server.start();

    std::cout << "server starts at port 8080" << std::endl;
    std::cin.get();
    server.stop();
    return 0;
}
