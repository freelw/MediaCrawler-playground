#!/bin/bash

docker build . \
  --build-arg HTTP_PROXY=$http_proxy \
  --build-arg HTTPS_PROXY=$https_proxy \
  --build-arg ALL_PROXY=$all_proxy \
  -t mediacrawler-playground:latest