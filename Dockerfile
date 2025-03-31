FROM quay.io/toolbx/ubuntu-toolbox:20.04

LABEL description="Base REMnux image for Distrobox"
LABEL maintainer="Marcel Alexandru Nitan"
LABEL version=2025.9.1

WORKDIR /tmp

COPY toolbox-linux-headers.sh /etc/profile.d

COPY extra-packages /tmp

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
        $(cat extra-packages | xargs)

RUN rm /tmp/extra-packages

RUN wget https://REMnux.org/remnux-cli
RUN mv remnux-cli remnux
RUN chmod +x remnux
RUN mv remnux /usr/local/bin

RUN sudo /usr/local/bin/remnux install --mode=addon --user remnux
