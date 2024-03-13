#!/bin/bash

mkdir $HOME/programs
cd $HOME/programs
sudo apt-get install ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim
cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=Release
make
sudo checkinstall --fstrans=no
sudo apt install npm python3-venv
