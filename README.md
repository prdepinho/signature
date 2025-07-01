# signature
A C++ REST server that provides some cryptographic services.


# Project Structure

This project consists of the following files:

| file                       | description                                                  |
|----------------------------|--------------------------------------------------------------|
| main.cpp                   | the main function                                            |
| test.cpp                   | the testing file                                             |
| digest.cpp, digest.h       | A class that encapsulates the openssl sha512 algorithm       |
| fibonacci.cpp, fibonacci.h | A request handler that answers for the /fib endpoint         |
| signature.cpp, signature.h | A request handler that answers for the /signature endpoint   |
| verify.cpp, verify.h       | A request handler that answers for the /verify endpoint      |
| CMakeLists.txt             | Cmake file                                                   |
| conanfile.txt              | Conan requirements                                           |
| build/resources/           | Folder containing the files used in testing.                 |


This microservice is based on the Poco Net architecture. The request handler factory is in `main.cpp` and
it delegates requests to the request handlers listed above. It has a digital signature service, a 
service for verifying digital signatures and a service for obtaining fibonacci numbers. They will
be explained shortly.

I made this project to learn some technologies. The server was made with the
Poco::Net library. Dependencies are handled with Conan, building with CMake and
testing with Catch2. The cryptographic algorithms are from OpenSSL. 

Of these, I had experience with CMake, so everything else was new to me. The most difficult was by far
OpenSSL. 

## The Process

I started by setting up a conanfile.txt and a CMakeLists.txt for the building
pipeline of the project. Then I got acquainted with the Poco packages and
learned how to make a simple REST server that serves a Fibonacci function, then
I prepared a file for unit tests. Next I studied how to make signatures and
verifications in OpenSSL, simultaneously figuring how the technology works
along with the library. This proved to be a challenge because even though the
documentation is complete and useful for learning its functions, it doesn't
make it easy to get into it, so I struggled to figure out how to make
signatures and verifications. Whilst the other tools had tutorials and a
gentler learning curve, OpenSSL is very dense and hard to get into. It is from
this challenge that I failed to achieve some objectives. I wish I had more time
to study it better. This was the most time consuming part of the project. I
wrote tests for the functions and developped the endpoints for the server.

The sign function should be equivalent to the following commands:
```bash
openssl pkcs12 -in pkcs12/certificado_teste_hub.pfx -out chave.pem -nodes
openssl pkey -in chave.pem -out pkey.pem
openssl x509 -in chave.pem -out cert.pem
openssl smime -sign -in arquivos/doc.txt -signer cert.pem -inkey pkey.pem -out signature.p7s -outform DER -binary -md sha512 -nodetach
```

And the verify function should be equivalent to this:
```bash
openssl smime -verify -in signature.p7s -inform DER -noverify -out verified.txt
```



## Future work

There are some things that I couldn't achieve in this project. The `/verify`
function does not return the signed document in the PEM format, but as a simple
conversion of the DER binary into Base64. It should use the sha-512 algorithm
that I prepared in the Digest class, but I couldn't figure that out, so it uses
the default sha-256 algorithm instead. The functions `/signature` and `/verify`
do not communicate well with each other, since the output of `/signature` is in
Base64, but `/verify` requires it in DER format. Verify should also have extracted 
more data from the signed document.


## Design decisions

Though it is not used in the endpoint `/signature`, the class `Digest` is
tested in the `test.cpp` file. It is a class wrapper of the OpenSSL algorithm
for obtaining the sha512 digest of a document. It has three functions: `init`
sets everything up. Instantiate an object and call `init`. Its destructor
will take care of cleaning things up, respecting the RAII principle,
especially if exceptions are raised. This makes using `Digest` safer than
using the OpenSSL functions directly. The function `update` receives data
and can be called multiple times to append the data. Finally `result`
returns a bytes vector with the digest.

The endpoints `/signature` and `/verify` use standalone functions `sign` and
`verify` to execute these functionalities. They do not create any files,
however. The endpoints receive the files sent to them and keep them in memory,
handling everything as byte vectors. The testing cases of these functions do
create files, though. These functions have not been encapsulted into classes,
since they are monolithic and would not benefit from it. 


# Building

To build this project, you need the latest version of CMake, Conan and GCC. 

## Install libraries and refresh CMake files

Execute the first command in the home folder of the project. The other commands in the /build folder.
``` bash
conan install . --output-folder=build --build=missing
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
```

## Build the binaries

``` bash
cmake --build . --config Release
```

## Run tests

``` bash
./Release/test.exe
```

## Run the server
``` bash
./Release/signature.exe
```

## Build, run tests and start the server
``` bash
cmake --build . --config Release && ./Release/test.exe && ./Release/signature.exe
```

# Functions

## Signature

This function will sign a digital document using a given certificate and
returns a CMS signed p7s file in Base64 format.
It will encode using the default algorithm sha-256.

The `/signature` function is a multipart/form-data POST call that receives three parameters:

- `document` is the document to be signed.
- `certificate` is the pfx certificate file.
- `password` is the password to extract the private key from the certificate.

As a result, the function will return a json with the following fields:

- `ok` is a boolean value that indicates whether the call has been successful or not.
- `pem` is the result of the signing in Base64. This will only appear if `ok` is true.

Even though the document is in Base64, it is not in PEM format, since it lacks the header and the tail.
This is a simple transformation from the DER format into Base64.

You can test this function with the following command:
``` bash
curl -X POST "127.0.0.1:8080/signature" -F "metadata=bry123456;filename=metadata.txt" -F "document=@build/resources/arquivos/doc.txt" -F "certification=@build/resources/pkcs12/certificado_teste_hub.pfx"
```


## Verify

This function verifies a given signed p7s document in DER format. Remember that /signature
gives us the signed document in PEM format. It has to be converted if used with /verify.

It verifies the content of the document and the signing attributes, but it does
not verify the certification chain.

The `/verify` function is a multipart/form-data POST call that receives one parameter:

- `p7s`: a DER format p7s file.

It returns a json with two members:

- `ok` is a boolean that indicates whether the call was successful.
- `valid` is the result of the document being valid. It will appear only if `ok` is true.

You can test this function with this command:
``` bash
curl -X POST "127.0.0.1:8080/verify" -F "p7s=@build/resources/output.p7s"
```


## Fibonacci

This function `/fib` is a GET call that calculates the fibonacci result of a
given number. It takes one parameter: 

- `i`, the input number. 

It responds with two values:

- `ok`: returns true if the call is successful.
- `response`: returns the fibonacci value if `ok` is true.

Test this function with:
``` bash
curl -X GET "127.0.0.1:8080/fib?i=12" -H "Content-Type: application/json"
```


