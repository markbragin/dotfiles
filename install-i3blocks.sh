#!/bin/bash

cd /tmp
git clone https://github.com/vivien/i3blocks
cd i3blocks
./autogen.sh
./configure
make
sudo checkinstall
