#!/bin/bash

# dotfiles directory
dotfiledir="${HOME}/dotfiles"


# symlinks
echo
read -p "Create symlinks? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    ${dotfiledir}/create-symlinks.sh
fi

# install shit
echo
read -p "Install packages? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    sudo apt update
    sudo apt upgrade
    sudo apt install git tmux xclip vim-gtk3 vim htop ripgrep wget curl gcc \
        sudo software-properties-common vifm gh tree gdb \
        xorg xinit i3 i3lock xss-lock i3blocks dunst engrampa \
        checkinstall libnotify-bin xinput pulseaudio yad xdotool autoconf \
        pavucontrol network-manager pulseaudio-utils feh atril evince \
        fonts-symbola ristretto ffmpeg thunar arc-theme python3-full \
        pulseaudio-module-jack acpi playerctl fd-find flameshot \
        cmus youtube-dl eyed3 python-is-python3
    # tmux.tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# install st
echo
read -p "Install st? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    ${dotfiledir}/install-st.sh
fi

# install ly (diplay manager)
echo
read -p "Install ly? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    ${dotfiledir}/install-ly.sh
fi

# i3blocks
echo
read -p "Install i3blocks 1.5? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    ${dotfiledir}/install-i3blocks.sh
fi

# install firefox
echo
read -p "Install firefox? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    ${dotfiledir}/install-firefox.sh
fi

# install neovim
echo
read -p "Install neovim? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    ${dotfiledir}/install-neovim.sh
fi

# vim-plug
echo
read -p "Download vim plug for vim? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


# install Fonts
echo
read -p "Install fonts (Iosevka, JetBrainsMono, Ubuntu)? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    ${dotfiledir}/install-fonts.sh
fi

# wallpaper
echo
read -p "Create wallpaper for i3? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
	echo "Copying wallpapers"
	cd "${dotfiledir}" || exit
	mkdir -p "${HOME}/Pictures"
	cp "wallpaper.jpg" "${HOME}/Pictures"
	cd "${HOME}/Pictures"
	xrandr | rg -i "current (\d+ x \d+)" -or '$1' | sed 's/ x /:/' | head -n1 | \
		xargs -I {} ffmpeg -i wallpaper.jpg -vf scale={} wallpaper.png
fi

# install icons
echo
read -p "Install tela icons? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    ${dotfiledir}/install-tela-icons.sh
fi

# install envycontrol
echo
read -p "Install envycontrol? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    open https://github.com/bayasdev/envycontrol/releases/
fi

echo
echo "Installation Complete!"
