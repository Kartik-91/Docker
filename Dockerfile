# Base Image
FROM fedora:latest

# User
USER root

# Working Directory
WORKDIR /root

# Making New User
RUN useradd kartik

# Making Home Directory
RUN mkdir /home/kartik

# Choosing home directory
RUN sudo usermod -d /home/kartik kartik

# Copy rootfs files
COPY ./rootfs /

# Install Packages
COPY install_packages.sh /tmp/
COPY scripts /tmp/scripts/
RUN bash /tmp/install_packages.sh

# docker run command
CMD ["zsh"]
