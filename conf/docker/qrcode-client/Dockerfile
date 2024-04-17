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

# Setting Environment variable
ENV QR_SERVER=qruser@qrcode-server
ENV QR_PASSWORD=12345678

# Setting Container
