#!/bin/bash

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

chmod 777 /abc
bundle exec rails server -b '0.0.0.0'
