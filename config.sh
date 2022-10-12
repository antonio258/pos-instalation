#!/bin/bash
distro=$1

function update () {
    echo "updating $distro..."
    if [[ $distro = "ubuntu" ]]
        then sudo apt-get update -y && sudo apt-get upgrade -y
    elif [[ $distro = "fedora" ]]
        then sudo dnf update -y
    elif [[ $distro = "arch" ]]
        then sudo pacman -Syyuu -y
    fi
}

function install () {
    echo "installing $distro..."
    if [[ $distro = "ubuntu" ]]
        then sudo add-apt-repository ppa:solaar-unifying/stable -y
        sudo apt-get update
        sudo apt-get install smplayer smplayer-themes steam wine htop persepolis obs-studio solaar default-jdk adminer zsh git wget youtube-dl libreoffice libreoffice-l10n-pt-br gimp ubuntu-restricted-extras telegram-desktop qbittorrent flatpak -y
    elif [[ $distro = "fedora" ]]
        then sudo dnf install smplayer smplayer-themes steam wine goverlay mangohud htop persepolis obs-studio solaar java-11-openjdk zsh git wget youtube-dl gimp telegram-desktop qbittorrent -y
            sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    elif [[ $distro = "arch" ]]
        then sudo pacman -Syyuu -y
        sudo pacman -S smplayer smplayer-themes steam wine htop persepolis obs-studio solaar jdk11-openjdk adminer zsh git go wget youtube-dl gimp telegram-desktop qbittorrent libreoffice-still libreoffice-still libreoffice-still-pt-br flatpak -y
        git clone https://aur.archlinux.org/yay.git ; cd yay ; makepkg -si
    fi

}

function zsh_install () {
    echo "installing oh-my-zsh $distro..."
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' /home/$USER/.zshrc
}

function extras () {
    echo "creating folders and configure fstab..."
    mkdir -p ~/.themes
    mkdir -p ~/.icons
    sudo echo "/dev/sdb1 /mnt/HD ntfs-3g defaults,noatime,uid=1000,umask=007,x-gvfs-show 0 0" >> /etc/fstab
    cd ~/Downloads ; git clone https://github.com/vinceliuice/Colloid-gtk-theme.git ; cd Colloid-gtk-theme ; ./install.sh --tweaks rimless -c dark -s compact --tweaks nord
    cd ~/Downloads ; git clone https://github.com/vinceliuice/Colloid-icon-theme.git ; cd Colloid-icon-theme ; ./install.sh -s nord
    cd ~/Downloads ; wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.26.2.13244.tar.gz
    cd ~/Downloads ; wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
}

update
install
zsh_install
extras