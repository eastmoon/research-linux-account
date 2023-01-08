FROM bash

# Install libaray
RUN \
    apk update
RUN \
    apk add \
        curl \
        rsync \
        openssh \
        sshpass

# Install script
# SFTP command ref : https://www.atlantic.net/vps-hosting/how-to-sftp-commands/
ADD sftp /sftp

# Create data directory
RUN \
    mkdir -p /data/download && \
    mkdir -p /data/upload
    
# Setting Environment variable
ENV SFTP_SERVER=sftpuser@sftp-server
ENV SFTP_PASSWORD=12345678
ENV SFTP_DOWNLOAD_DIR=/data/download/
ENV SFTP_UPLOAD_DIR=/data/upload/

# Setting Container
