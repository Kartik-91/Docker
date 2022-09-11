#!/bin/bash

# Git Configuration
export GIT_USERNAME="Kartik-91"
export GIT_EMAIL="kartikbanwalaop@gmail.com"

git config --global user.name "${GIT_USERNAME}"
git config --global user.email "${GIT_EMAIL}"

# TimeZone Configuration
export TZ="Asia/Kolkata"
ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime
