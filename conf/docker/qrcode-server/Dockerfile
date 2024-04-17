FROM ubuntu:latest

# Install Software
RUN \
    apt-get update -y && \
    apt-get install -y \
        ssh \
        openssh-server

# Install QRCode
RUN \
    apt-get update -y && \
    apt-get install -y \
        qrencode \
        catimg
        
# Setting Container
EXPOSE 22
WORKDIR /
