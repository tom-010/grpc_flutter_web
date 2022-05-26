grpc_flutter_web
================

gRPC does not work in javascript (and thus flutter web) out of the box. 
Therefore, we need an envoy proxy as translator for the javascript and 
flutter-web clients. This repo shows an hello-world example with unary 
and server-streaming requests, done directly from client to server in 
go, dart and flutter-linux and over the envoy proxy in flutter-web and 
javascript.


## Step 1: Install grpc-web

```bash
wget https://github.com/grpc/grpc-web/releases/download/1.3.1/protoc-gen-grpc-web-1.3.1-linux-x86_64
mv protoc-gen-grpc-web-1.3.1-linux-x86_64 protoc-gen-grpc-web
chmod +x protoc-gen-grpc-web
sudo mv protoc-gen-grpc-web /usr/local/bin/
```

## Step 2: Generate proto files

```bash
./scripts/generate_grpc.sh
```

## Step 3: Start Proxy and Server

In two different terminals, run:

```bash
./scripts/run_proxy.sh
./scripts/run_server.sh
```

## Step 4: Test the clients

All clients should output the same messages!

### Go

```bash
./scripts/run_client_go.sh
```

### Dart

```bash
./scripts/run_client_dart.sh
```

### Javscript

```bash
./scripts/run_client_js.sh
```

Open the browser, navigate to [http://localhost:8081](http://localhost:8081) 
and open the console

### Linux

```bash
./scripts/run_client_linux.sh
```

Press the butten in the lower right corner

### Flutter Web

```bash
./scripts/run_client_web.sh
```

Press the butten in the lower right corner