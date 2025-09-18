#!/bin/bash

# Install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
rm -rf yay-bin

# Install required packages

sudo pacman -S --noconfirm \
    systemctl-tui \
    cliphist \
    wl-clipboard \
    wl-clip-persist \
    hyprshot \
    gvfs-smb \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    ghostty \
    zoxide \
    nautilus \
    sushi \
    btop \
    fastfetch \
    docker \
    docker-compose \
    docker-buildx \
    stow \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-hyprland \
    lazydocker \
    wiremix \
    ttf-jetbrains-mono-nerd \
    ttf-meslo-nerd \
    waybar \
    hyprpaper \
    hypridle \
    signal-desktop \
    fd \
    eza \
    fzf \
    ripgrep \
    bat \
    jq \
    yq \
    lazygit \
    tldr \
    less \
    playerctl \
    chromium \
    mpv \
    nvtop \
    yazi \
    mise \
    libreoffice \
    git-delta \
    ncdu \
    ncspot \
    rofi

yay -S --noconfirm --needed \
    hyprpaper \
    localsend \
    1password-beta \
    1password-cli \
    man \
    visual-studio-code-bin \
    zen-browser-bin \
    spotify \
    dropbox \
    nautilus-dropbox  \
    nwg-look \
    python-terminaltexteffects \
    posting
