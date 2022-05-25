
## Step 1: Install grpc-web

```bash
wget https://github.com/grpc/grpc-web/releases/download/1.3.1/protoc-gen-grpc-web-1.3.1-linux-x86_64
mv protoc-gen-grpc-web-1.3.1-linux-x86_64 protoc-gen-grpc-web
chmod +x protoc-gen-grpc-web
sudo mv protoc-gen-grpc-web /usr/local/bin/
```

## Step 2: Generate proto files

```bash
protoc -I=. helloworld.proto \
  --js_out=import_style=commonjs:. \
  --grpc-web_out=import_style=commonjs,mode=grpcwebtext:.
```

## Step 2: Build the frontend (and backend)

```bash
npm install
npx webpack client.js
```

Now `dist/client.js` exists

## Step 3: Start up

Run these commands in three different terminals:

```bash
node server.js
docker run -v "$(pwd)"/envoy.yaml:/etc/envoy/envoy.yaml:ro --network=host envoyproxy/envoy:v1.22.0
python3 -m http.server 8081
```

## Step 4: Check

Open [http://localhost:8081/](http://localhost:8081/) and open the console. There should be this output:

```
Hello! World
Hey! World0
Hey! World1
Hey! World2
Hey! World3
Hey! World4
```