#!/bin/bash

# dotfiles directory
dotfiledir="${HOME}/dotfiles"

echo
read -p "Symlinks? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    # list of files/folders to symlink in ${homedir}
    files=(
        .bashrc
        .bash_aliases
        .vimrc
        .tmux.conf
        scripts
    )

    cd "${dotfiledir}" || exit
    for file in "${files[@]}"; do
        echo "Creating symlink to $file in home directory."
        ln -sf "${dotfiledir}/${file}" "${HOME}/${file}"
    done

    mkdir -p $HOME/.config
    cd ".config" || exit
    files=$(ls)
    for file in $files; do
        echo "Creating symlink to ${file} in home directory."
        ln -sf "${dotfiledir}/.config/${file}" "${HOME}/.config/${file}"
    done

    mkdir -p $HOME/bin
    files=$(ls $HOME/scripts/*.sh)
    for i in $files; do
        link=$(echo $i | xargs basename | sed "s/.sh//")
        echo "Creating symlink to ${i} in ~/bin directory."
        ln -fs "${i}" "${HOME}/bin/${link}"
    done

    mkdir -p "${HOME}/.local/share"
    cp -r "${HOME}/scripts/cmakegen-src" "${HOME}/.local/share"
    cp -r "${HOME}/scripts/cgen-src" "${HOME}/.local/share"
fi

# install shit
echo
read -p "Install packages? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    sudo apt update
    sudo apt upgrade
    sudo apt install git tmux xclip vim-gtk3 vim htop ripgrep wget curl gcc \
        sudo software-properties-common vifm gh tree \
        xorg xinit i3 i3lock xss-lock i3blocks dunst engrampa \
        checkinstall libnotify-bin xinput pulseaudio yad xdotool autoconf \
        pavucontrol network-manager pulseaudio-utils feh atril evince \
        fonts-symbola ristretto ffmpeg thunar arc-theme python3-full \
        pulseaudio-module-jack acpi
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
