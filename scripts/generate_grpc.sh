#!/bin/bash

echo "generate server"
protoc \
    --go_out=server \
    --go_opt=paths=source_relative \
    --go-grpc_out=server \
    --go-grpc_opt=paths=source_relative \
    proto/greeter.proto

echo "generate js-client"
cd client/js
protoc -I=../../proto ../../proto/greeter.proto \
  --js_out=import_style=commonjs:. \
  --grpc-web_out=import_style=commonjs,mode=grpcwebtext:.
cd ../..

