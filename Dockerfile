# Base Image
FROM fedora:latest

# User
USER root

# Working Directory
WORKDIR /root

# Adding New User
RUN useradd ubuntu

# Making New Directory
RUN mkdir /home/ubuntu

# Selecting Home directory
RUN usermod -d /home/ubuntu ubuntu

# Copy rootfs files
COPY ./rootfs /

# Install Packages
COPY install_packages.sh /tmp/
COPY scripts /tmp/scripts/
RUN bash /tmp/install_packages.sh

# docker run command
CMD ["zsh"]
