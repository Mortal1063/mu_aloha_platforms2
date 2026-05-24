#!/bin/bash
echo hello docker

# Replace APT Source
#sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
#sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# Install Dependence
cd
apt update
apt -y install sudo
./build_setup.sh
pip install --upgrade -r pip-requirements.txt
source SurfaceDuo/bin/activate
git config --global --add safe.directory '*'
sudo chown -R root .
./build_uefi.py -s all
exit
