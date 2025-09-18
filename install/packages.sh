#!/bin/bash

# File paths for package lists
PACKAGE_PATH="packages"
COMMON_FILE="common"
MACOS_FILE="macos"
ARCH_FILE="arch"

# Function to install packages with Homebrew on macOS
install_with_brew() {
  if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  echo "Installing common packages with Homebrew..."
  while IFS= read -r pkg; do
    if [[ -n "$pkg" ]]; then
      brew install "$pkg"
    fi
  done < "$PACKAGE_PATH/$COMMON_FILE"
  
  echo "Installing macOS-specific packages with Homebrew..."
  while IFS= read -r pkg; do
    if [[ "$pkg" =~ ^cask: ]]; then
      # Package to install via yay
      pkg_name="${pkg#cask:}"
      brew install --cask "$pkg_name"
    else
        brew install "$pkg"
    fi
  done < "$PACKAGE_PATH/$MACOS_FILE"
}

# Function to install packages with yay or pacman on Arch Linux
install_with_yay_pacman() {
  if ! command -v yay &>/dev/null; then
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    rm -rf yay-bin
  fi

  echo "Installing common packages with yay or pacman..."
  while IFS= read -r pkg; do
    if [[ -n "$pkg" ]]; then
      if [[ "$pkg" =~ ^yay: ]]; then
        # Package to install via yay
        pkg_name="${pkg#yay:}"
        yay -S --noconfirm "$pkg_name"
      else
        sudo pacman -S --noconfirm "$pkg_name"
      fi
    fi
  done < "$PACKAGE_PATH/$COMMON_FILE"

  echo "Installing Arch-specific packages..."
  while IFS= read -r pkg; do
    if [[ -n "$pkg" ]]; then
      if [[ "$pkg" =~ ^pacman: ]]; then
        # Package to install via pacman
        pkg_name="${pkg#pacman:}"
        sudo pacman -S --noconfirm "$pkg_name"
      elif [[ "$pkg" =~ ^yay: ]]; then
        # Package to install via yay
        pkg_name="${pkg#yay:}"
        yay -S --noconfirm "$pkg_name"
      else
        # Default, install with yay
        yay -S --noconfirm "$pkg"
      fi
    fi
  done < "$PACKAGE_PATH/$ARCH_FILE"
}

# Detect OS and perform installation
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Detected macOS"
  install_with_brew
elif [[ -f /etc/arch-release ]]; then
  echo "Detected Arch Linux"
  install_with_yay_pacman
else
  echo "Unsupported OS. This script currently supports macOS and Arch Linux."
  exit 1
fi
