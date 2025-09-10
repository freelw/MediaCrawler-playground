#!/bin/bash

docker run -it --rm \
  --workdir /code/MediaCrawler \
  --network host \
  mediacrawler-playground:latest /bin/bash 
  
