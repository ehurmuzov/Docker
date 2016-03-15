#!/bin/bash
IMAGE_NAME=realsoft/payara:4.1.1.154

docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]
then
    echo "Build failed!"
else
    echo "Payara 4.1.1.154 docker image has been built."
    echo "To start a new container, execute: docker run -i -P -t realsoft/payara:4.1.1.154  /bin/bash"
    echo " or "
    echo "docker run -d -P -t realsoft/payara:4.1.1.154"
fi
