FROM ubuntu:bionic

RUN apt-get update \
 && apt-get install -y \
      cpio \
      iproute2 \
      software-properties-common \
      unzip \
      binutils \
      jq \
      netcat \
      lib32gcc1 \
      lib32stdc++6 \
      wget \
      git \
      vim \
      curl \
      file \
      tar \
      bzip2 \
      gzip \
      unzip \
      bsdmainutils \
      python \
      util-linux \
      ca-certificates \
      binutils \
      bc \
      jq \
      tmux \
      netcat \
 && add-apt-repository multiverse \
 && echo "Installing 32 bit packages" \
 && DEBIAN_FRONTEND=noninteractive dpkg --add-architecture i386 \
 && apt-get update \
 && apt-get install -y \
      lib32gcc1 \
      lib32stdc++6 \
      libsdl2-2.0-0:i386 \
 && echo "installing steamcmd" \
 && echo steam steam/question select "I AGREE" | debconf-set-selections  \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y  steamcmd \
 && echo echo "configuring notroot user" \
 && adduser --disabled-password --gecos "" vhserver


USER vhserver
WORKDIR /home/vhserver

RUN wget -O linuxgsm.sh https://linuxgsm.sh \
  && chmod +x linuxgsm.sh \
  && bash linuxgsm.sh vhserver \
#  && ./vhserver install


ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/vhserver"

CMD tail -f /dev/null

###############
# Usage: run it, bash in, use it

###############
# credits:
# debconf for steamcmd:
#   \ https://github.com/zobees/docker-steamcmd/blob/master/Dockerfile

