#!/bin/bash

docker run -it --rm \
  -v $(pwd)/../MediaCrawler:/code/MediaCrawler \
  --workdir /code/MediaCrawler \
  --network host \
  mediacrawler-playground:latest /bin/bash 
  
