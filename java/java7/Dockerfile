#
# realsoft/java7
# Base image with java7
# 
# 
#
# 

FROM realsoft/ubuntu-core:16.04.3

MAINTAINER Emil Hurmuzov, emil@hurmuzov.com

RUN \
    apt-get update && \
    apt-get install -y software-properties-common && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && apt-get upgrade -y  &&\
    apt-get install -y oracle-java7-installer && \
    apt-get install -y wget && \
    apt-get install -y curl && \
    apt-get install -y unzip && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk7-installer

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle




