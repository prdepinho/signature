
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
  curl -X POST "127.0.0.1:8080/signature" -F "password=bry123456;filename=metadata.txt" -F "document=@build/resources/arquivos/doc.txt" -F "certificate=@build/resources/pkcs12/certificado_teste_hub.pfx"

Test /verify
  curl -X POST "127.0.0.1:8080/verify" -F "p7s=@build/resources/output.p7s"

Sign:
  openssl pkcs12 -in pkcs12/certificado_teste_hub.pfx -out chave.pem -nodes
  openssl pkey -in chave.pem -out pkey.pem
  openssl x509 -in chave.pem -out cert.pem
  openssl smime -sign -in arquivos/doc.txt -signer cert.pem -inkey pkey.pem -out signature.p7s -outform DER -binary -md sha512 -nodetach

Verify:
  openssl smime -verify -in signature.p7s -inform DER -noverify -out verified.txt

Get Data:
  openssl cms -cmsout -print -inform DER -in output.p7s 
 */



using namespace Poco::Net;
using namespace Poco::JSON;
using namespace Poco;


class ServerFactory : public HTTPRequestHandlerFactory {
public:
    HTTPRequestHandler *createRequestHandler(const HTTPServerRequest &request) override {
        std::string uri = request.getURI();
        std::cout << "request uri: " << uri << std::endl;
        if (uri == "/fib") {
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

    HTTPRequestHandlerFactory::Ptr factory = new ServerFactory;
    HTTPServerParams::Ptr params = new HTTPServerParams;

    HTTPServer server(factory, ServerSocket(8080), params);
    server.start();

    std::cout << "server starts at port 8080" << std::endl;
    std::cin.get();
    server.stop();
    return 0;
}
