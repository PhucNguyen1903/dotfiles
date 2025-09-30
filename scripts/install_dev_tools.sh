#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Install Homebrew if not installed
if ! command_exists brew; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

# Update Homebrew to ensure latest package info
echo "Updating Homebrew..."
brew update
/opt/homebrew

# Install or upgrade a package if not present or outdated
install_or_upgrade() {
  if brew list "$1" >/dev/null 2>&1; then
    echo "$1 already installed. Upgrading to latest version..."
    brew upgrade "$1"
  else
    echo "Installing $1..."
    brew install "$1"
  fi
}

# List of packages to install
packages=(wezterm aerospace sketchybar neovim starship)

# Install or upgrade each package
for pkg in "${packages[@]}"; do
  install_or_upgrade "$pkg"
done

echo "All requested dev tools are installed and up to date."
