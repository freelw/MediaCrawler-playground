#!/bin/bash

docker run -it --rm \
  --network host \
  --privileged \
  -v /run/dbus/system_bus_socket:/run/dbus/system_bus_socket \
  wangli-chrome:latest /bin/bash
# xvfb-run /usr/bin/google-chrome-stable --no-sandbox --remote-debugging-port=9222 --user-data-dir=/tmp/chrome_dbg