#!/bin/bash
# usage: tag_number

CONTAINER_NAME="rex"

docker rm -f $CONTAINER_NAME

docker run --name=$CONTAINER_NAME -d -p 8181:8080 chasky/spring-calc:$1
if [ $? != 0 ]; then
  exit 1
fi

echo "Waiting for port 8181"
while ! netcat -z localhost 8181; do sleep 5; done

sleep 20

curl  http://localhost:8181/greeting?name=Rex
docker rm -f $CONTAINER_NAME