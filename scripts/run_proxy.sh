#!/bin/bash

cd proxy
docker run -v "$(pwd)"/envoy.yaml:/etc/envoy/envoy.yaml:ro --network=host envoyproxy/envoy:v1.22.0