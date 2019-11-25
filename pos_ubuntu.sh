#!/bin/bash

sudo apt-get -y update
sudo apt-get -y full-upgrade
sudo apt-get -y install smplayer conky conky-all smplayer-themes libreoffice libreoffice-l10n-pt-br gimp qbittorrent rhythmbox telegram-desktop htop lm-sensors pulseeffects lsp-plugins openjdk-8-jdk openjfx ubuntu-restricted-extras zsh wget git
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' .zshrc
