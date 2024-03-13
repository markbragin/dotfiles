#!/bin/bash

mkdir $HOME/programs
cd $HOME/programs
sudo apt install x11proto-dev libx11-dev libxft-dev
git clone https://github.com/markbragin/st.git
cd st
make
sudo checkinstall --fstrans=no
