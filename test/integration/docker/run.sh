#!/bin/bash
set -v

cd $DOCKER_ROOT && cp $DOCKER_FILE Dockerfile && docker build -t ansible/$DOCKER_NAME:latest .

if [ -n $DOCKER_FILE ]; then
  cd $TRAVIS_BUILD_DIR
  docker run --privileged=true --name=$DOCKER_NAME -t -v $PWD:/ansible ansible/$DOCKER_NAME:latest &
  sleep 10
  docker exec -i -t $DOCKER_NAME /ansible/test/integration/docker/init.sh
  EXIT_CODE=`echo $?`
  docker stop $DOCKER_NAME
  exit $EXIT_CODE
fi

