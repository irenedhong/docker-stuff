#!/usr/bin/env bash
apt install -yq xvfb default-jre default-jdk
adduser --disabled-password --gecos "" selenium &&\
echo 'selenium:12345abc' | chpasswd