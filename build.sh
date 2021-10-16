#!/usr/bin/env bash
set -x

cd
apt update
apt install npm python3 python3-pip ttfautohint gcc -y
pip3 install afdko &

apt install git -y
git clone https://github.com/iYato/Sarasa-Gothic.git &

cd /tmp
wget https://github.com/premake/premake-core/releases/download/v5.0.0-alpha16/premake-5.0.0-alpha16-linux.tar.gz
tar xzf premake-5.0.0-alpha16-linux.tar.gz
chmod +x premake5 /usr/local/bin
mv premake5 /usr/local/bin/
cd

git clone https://github.com/caryll/otfcc.git
cd otfcc
premake5 gmake
cd build/gmake
make config=release_x64
cd ../../bin/release-x64/
chmod +x otfcc*
mv otfcc* /usr/local/bin

cd ~/Sarasa-Gothic
npm install
npm run build ttc
