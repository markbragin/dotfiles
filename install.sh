#!/bin/bash

# dotfiles directory
dotfiledir="${HOME}/dotfiles"

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

# install shit
echo
read -p "Install packages? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    sudo apt update
    sudo apt upgrade
    sudo apt install git tmux xclip vim-gtk3 vim htop ripgrep wget curl gcc \
        sudo software-properties-common vifm gh tree
    sudo apt install xorg xinit i3 i3lock xss-lock i3blocks dunst \
        checkinstall libnotify-bin xinput pulseaudio yad xdotool autoconf \
        pavucontrol network-manager pulseaudio-utils feh atril evince \
        fonts-symbola ristretto ffmpeg
fi

echo "Copying wallpapers"
cd "${dotfiledir}" || exit
mkdir -p "${HOME}/Pictures"
cp "wallpaper.jpg" "${HOME}/Pictures"
cd "${HOME}/Pictures"
xrandr | rg -i "current (\d+ x \d+)" -or '$1' | sed 's/ x /:/' | head -n1 | \
    | xargs -I {} ffmpeg -i wallpaper.jpg -vf scale={} wallpaper.png


# vim-plug
echo
read -p "Download vim plug? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# install Fonts

echo
read -p "Install fonts (Iosevka, JetBrainsMono)? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    ${dotfiledir}/install-fonts.sh
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
#
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

echo
read -p "Install neovim? [y/n]" confirm
if [[ ${confirm} == [yY] ]]; then
    ${dotfiledir}/install-neovim.sh
fi

echo
echo "Installation Complete!"
