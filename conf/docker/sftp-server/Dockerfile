FROM ubuntu:latest

# Install Software
RUN \
    apt-get update -y && \
    apt-get install -y \
        ssh \
        openssh-server

# Setting Container
EXPOSE 22
WORKDIR /
