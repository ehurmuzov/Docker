#!/bin/bash
set -e
set -x

VER=16.04.3
#VERSHORT=$(echo $VER | sed 's/\(^[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g')


#FILE=ubuntu-core-${VER}-core-amd64.tar.gz
#URL=http://cdimage.ubuntu.com/ubuntu-core/releases/${VERSHORT}/release/${FILE}
#SHA256SUMURL=http://cdimage.ubuntu.com/ubuntu-core/releases/${VERSHORT}/release/SHA256SUMS

FILE=ubuntu-xenial-core-cloudimg-amd64-root.tar.gz
SHA256SUMURL=https://partner-images.canonical.com/core/xenial/current/SHA256SUMS
URL=https://partner-images.canonical.com/core/xenial/current/ubuntu-xenial-core-cloudimg-amd64-root.tar.gz

check()
{
  grep $FILE SHA256SUMS | sha256sum -c
}

if [ -f SHA256SUMS ]
then
  rm -f SHA256SUMS
fi

wget $SHA256SUMURL

if [ -e $FILE ]
then
  if ! check
  then
    rm -f $FILE
  fi
fi

if [ ! -e $FILE ]
then
  wget $URL
  check
fi

#cat $FILE | docker import - realsoft/ubuntu-core:${VER}
docker import $FILE realsoft/ubuntu-core:${VER}