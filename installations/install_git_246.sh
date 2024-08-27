#!/bin/bash

sudo yum update -y
sudo yum groupinstall 'Development Tools'
sudo yum install openssl-devel curl-devel expat-devel gettext-devel zlib-devel

# move to home directory
# shellcheck disable=SC2164
cd ~

# ensure wget is installed
if ! command -v wget &> /dev/null
then
    sudo yum install wget
fi

# ensure curl version is 7.68.0 or later
curl_version=$(curl --version | head -n 1 | awk '{print $2}')
# shellcheck disable=SC2046
if [ $(echo "$curl_version < 7.68.0" | bc -l) -eq 1 ]
then
    curl_filename="curl-7.68.0.tar.gz"
    curl_url="https://curl.haxx.se/download/$curl_filename"
    if [ ! -f $curl_filename ]
    then
        wget $curl_url
    fi
    rm -rf curl-7.68.0
    tar -xvf $curl_filename
    # shellcheck disable=SC2164
    cd curl-7.68.0
    ./configure --prefix=/usr/local
    make
    sudo make install
fi

version="2.46.0"
file_prefix="git-$version"
filename="$file_prefix.tar.gz"

# download tar ball if not already downloaded
if [ ! -f $filename ]
then
  url="https://mirrors.edge.kernel.org/pub/software/scm/git/$filename"
  wget $url
fi

# extract git source code with overwrite
rm -rf $file_prefix
tar -xvf $filename
# shellcheck disable=SC2164
cd $file_prefix

# configure and make git
make configure
./configure --prefix=/usr
make
sudo make install
