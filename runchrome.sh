#!/bin/bash

docker run -it --rm \
  --network host \
  wangli-chrome:latest /bin/bash
  