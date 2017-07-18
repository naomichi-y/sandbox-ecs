#!/bin/bash

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

sleep 3
# bundle exec rails server -b '0.0.0.0'
