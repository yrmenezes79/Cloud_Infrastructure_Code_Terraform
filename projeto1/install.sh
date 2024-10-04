#!/bin/bash
set -ex
sudo apt update -y
sudo apt install docker -y
sudo systemctl start  docker
sudo usermod -a -G docker ec2-user
