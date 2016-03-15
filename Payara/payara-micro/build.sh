#!/bin/bash
IMAGE_NAME=realsoft/payara:latest.micro.oraclejdk8

docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]
then
    echo "Build failed!"
else
    echo "The payara-micro docker image has been built. To start a new container, execute: docker run -i -t payara:latest.micro.oraclejdk8"
fi
