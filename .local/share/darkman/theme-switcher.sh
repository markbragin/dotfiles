#!/bin/sh

case "$1" in
    dark)
        # dconf
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
        gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

        # gtk3
        sed -i 's/gtk-theme-name=.*/gtk-theme-name=Adwaita-dark/g' ~/.config/gtk-3.0/settings.ini
        sed -i 's/gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=1/g' ~/.config/gtk-3.0/settings.ini

        # gtk4
        mkdir -p ~/.config/gtk-4.0
        sed -i 's/gtk-theme-name=.*/gtk-theme-name=Adwaita-dark/g' ~/.config/gtk-4.0/settings.ini 2>/dev/null || echo "gtk-theme-name=Adwaita-dark" >> ~/.config/gtk-4.0/settings.ini
        sed -i 's/gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=1/g' ~/.config/gtk-4.0/settings.ini 2>/dev/null || echo "gtk-application-prefer-dark-theme=1" >> ~/.config/gtk-4.0/settings.ini

        # alacritty
        cp ~/.config/alacritty/dark-theme.toml ~/.config/alacritty/theme.toml
        
        # tmux
        cp ~/.tmux/dark-theme.conf ~/.tmux/theme.conf
        tmux source-file ~/.tmux.conf 2>/dev/null
        ;;

    light)
        # dconf
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
        gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'

        # gtk3
        sed -i 's/gtk-theme-name=.*/gtk-theme-name=Adwaita/g' ~/.config/gtk-3.0/settings.ini
        sed -i 's/gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=0/g' ~/.config/gtk-3.0/settings.ini

        # gtk4
        mkdir -p ~/.config/gtk-4.0
        sed -i 's/gtk-theme-name=.*/gtk-theme-name=Adwaita/g' ~/.config/gtk-4.0/settings.ini 2>/dev/null || echo "gtk-theme-name=Adwaita" >> ~/.config/gtk-4.0/settings.ini
        sed -i 's/gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=0/g' ~/.config/gtk-4.0/settings.ini 2>/dev/null || echo "gtk-application-prefer-dark-theme=0" >> ~/.config/gtk-4.0/settings.ini

        # alacritty
        cp ~/.config/alacritty/light-theme.toml ~/.config/alacritty/theme.toml

        # tmux
        cp ~/.tmux/light-theme.conf ~/.tmux/theme.conf
        tmux source-file ~/.tmux.conf 2>/dev/null
        ;;
esac
