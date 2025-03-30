FROM quay.io/toolbx/ubuntu-toolbox:20.04

LABEL description="Base REMnux image for Distrobox"
LABEL maintainer="Marcel Alexandru Nitan"
LABEL version=2025.9.1

WORKDIR /tmp


RUN wget https://REMnux.org/remnux-cli
RUN mv remnux-cli remnux
RUN chmod +x remnux
RUN mv remnux /usr/local/bin

RUN sudo /usr/local/bin/remnux install --mode=addon --user remnux
