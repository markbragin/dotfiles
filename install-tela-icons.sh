#!/bin/bash

cd /tmp
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme/
mkdir -p "$HOME/.icons"
./install.sh -c blue -d "$HOME/.icons"
