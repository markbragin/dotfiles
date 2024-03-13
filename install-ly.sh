#!/bin/bash

mkdir $HOME/programs
cd $HOME/programs
sudo apt install build-essential libpam0g-dev libxcb-xkb-dev
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make installsystemd
sudo checkinstall --fstrans=no
sudo systemctl enable ly.service
