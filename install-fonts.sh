#!/bin/bash

cd /tmp
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
mkdir -p ${HOME}/.fonts/JetBrainsMono
unzip JetBrainsMono* -d ${HOME}/.fonts/JetBrainsMono

wget https://github.com/be5invis/Iosevka/releases/download/v29.0.0/PkgTTC-IosevkaSS04-29.0.0.zip
mkdir -p ${HOME}/.fonts/IosevkaSS04
unzip *Iosevka* -d ${HOME}/.fonts/IosevkaSS04

wget https://assets.ubuntu.com/v1/0cef8205-ubuntu-font-family-0.83.zip
mkdir -p ${HOME}/.fonts/Ubuntu
unzip *ubuntu* -d ${HOME}/.fonts/Ubuntu
