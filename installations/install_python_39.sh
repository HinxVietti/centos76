#!/bin/bash

sudo yum update -y

# ensure build tools and dev tools installed
sudo yum groupinstall "Development Tools" -y
sudo yum install wget openssl-devel bzip2-devel libffi-devel -y

# ensure wget is installed
if [ ! -x "$(command -v wget)" ]; then
    sudo yum install -y wget
fi

# download and install Python 3.9 tarball
wget https://www.python.org/ftp/python/3.9.19/Python-3.9.19.tgz
tar -xzf Python-3.9.19.tgz
# shellcheck disable=SC2164
cd Python-3.9.19
./configure --enable-optimizations
# shellcheck disable=SC2046
make -j$(nproc)
sudo make altinstall

# echo build results
clear
echo "Python 3.9 build complete."
# verify installation
python3.9 --version
