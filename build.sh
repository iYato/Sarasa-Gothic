#!/usr/bin/env bash
set -ex

DIR=$(pwd)

apt update
apt install npm python3 python3-pip ttfautohint gcc -y
pip3 install afdko

cd /tmp
wget https://github.com/premake/premake-core/releases/download/v5.0.0-alpha16/premake-5.0.0-alpha16-linux.tar.gz
tar xzf premake-5.0.0-alpha16-linux.tar.gz
chmod +x premake5 /usr/local/bin
mv premake5 /usr/local/bin/

git clone https://github.com/caryll/otfcc.git
cd otfcc
premake5 gmake
cd build/gmake
make config=release_x64
cd ../../bin/release-x64/
chmod +x otfcc*
mv otfcc* /usr/local/bin

cd $DIR
npm install
npm run build ttc
