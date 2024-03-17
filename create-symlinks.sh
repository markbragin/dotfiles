#!/bin/bash

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
