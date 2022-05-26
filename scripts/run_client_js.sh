#!/bin/bash

cd client/js

npm install
npx webpack client.js
python3 -m http.server 8081