# Base Image: Ubuntu
FROM ubuntu:latest

# Working Directory
WORKDIR /root

# Maintainer
MAINTAINER Kartik-91 <kartik banwalaop@gmail.com>

# Delete the profile files (we'll copy our own in the next step)
RUN \
rm -f \
    /etc/profile \
    ~/.profile \
    ~/.bashrc

# Copy the Proprietary Files
COPY ./proprietary /

# apt update
RUN apt update

# Install sudo
RUN apt install apt-utils sudo -y

# Making New User
RUN useradd ubuntu

# Making Home Directory
RUN mkdir /home/ubuntu

# Choosing home directory
RUN sudo usermod -d /home/ubuntu ubuntu

# Giving sudo perms to New User
RUN sudo usermod -aG sudo ubuntu

# tzdata
ENV TZ Asia/Kolkata

RUN \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata \
&& ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
&& apt-get install -y tzdata \
&& dpkg-reconfigure --frontend noninteractive tzdata

# Install git and ssh
RUN sudo apt install git ssh -y

# Configure git
ENV GIT_USERNAME Kartik-91
ENV GIT_EMAIL kartikbanwala91@gmail.com
RUN \
    git config --global user.name $GIT_USERNAME \
&&  git config --global user.email $GIT_EMAIL

# Install Packages
RUN \
sudo apt install \
    curl wget aria2 tmate python2 python3 silversearch* \
    iputils-ping iproute2 \
    nano rsync rclone tmux screen openssh-server \
    python3-pip adb fastboot jq npm neofetch mlocate \
    zip unzip tar ccache \
    cpio lzma \
    -y

# Filesystems
RUN \
sudo apt install \
    erofs-utils \
    -y

RUN \
sudo pip install \
    twrpdtgen

# Install schedtool and Java
RUN \
    sudo apt install \
        schedtool openjdk-8-jdk \
    -y

# Setup Android Build Environment
RUN \
git clone https://github.com/akhilnarang/scripts.git /tmp/scripts \
&& sudo bash /tmp/scripts/setup/android_build_env.sh \
&& rm -rf /tmp/scripts

# Use python2 as the Default python
RUN \
sudo ln -sf /usr/bin/python2 /usr/bin/python

# Run bash
CMD ["bash"]
