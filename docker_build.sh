#!/bin/bash

docker build -t chasky/spring-calc:$1 .

docker rm -f rex

docker run --name=rex -d -p 8181:8080 chasky/spring-calc:$1
if [ $? != 0 ]; then
  exit 1
fi

sleep 2 && curl http://localhost:8181/greeting?name=Rex