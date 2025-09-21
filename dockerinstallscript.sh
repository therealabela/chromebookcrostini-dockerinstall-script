#!/bin/bash
# ============================================
# Universal Docker Installer Script
# Author: therealabela | github.com/therealabela
# Works on Debian/Ubuntu, Fedora/RHEL/CentOS, Arch/Manjaro, openSUSE/SUSE derivatives
# ============================================

# Clear screen and show welcome
clear
echo "-------------------------"
echo "🚀 Unoffical Docker Installer 🚀"
echo "-------------------------"
echo "By: therealabela | github.com/therealabela"
echo "-------------------------"
echo "Running Installation Script:"
echo "This may take 5-10 min depending on your system!"
echo "-------------------------"

# Detect OS & family
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    FAMILY=$ID_LIKE
else
    echo "[ERROR] Cannot detect OS. Exiting."
    exit 1
fi

echo "[INFO] Detected OS: $OS (family: $FAMILY)"

# Normalize OS family for common derivatives
case "$OS" in
    debian|ubuntu) FAMILY="debian" ;;
    fedora|rhel|centos) FAMILY="fedora" ;;
    arch|manjaro) FAMILY="arch" ;;
    opensuse*|sles) FAMILY="suse" ;;
esac

# Update & Install Docker based on family
case "$FAMILY" in
    *debian*)
        echo "-------------------------"
        echo "Installing Docker (Debian/Ubuntu derivative)"
        echo "-------------------------"
        sudo apt update -y
        sudo apt install -y ca-certificates curl gnupg lsb-release
        sudo mkdir -p /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/$OS/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$OS $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt update -y
        sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
        ;;
    *fedora*)
        echo "-------------------------"
        echo "Installing Docker (Fedora/RHEL/CentOS derivative)"
        echo "-------------------------"
        sudo dnf -y install dnf-plugins-core
        sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
        sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
        ;;
    *arch*)
        echo "-------------------------"
        echo "Installing Docker (Arch/Manjaro derivative)"
        echo "-------------------------"
        sudo pacman -Sy --noconfirm docker
        ;;
    *suse*)
        echo "-------------------------"
        echo "Installing Docker (openSUSE/SUSE derivative)"
        echo "-------------------------"
        sudo zypper install -y docker
        ;;
    *)
        echo "[ERROR] Unsupported distribution: $OS ($FAMILY)"
        exit 1
        ;;
esac

# Update system 
clear
echo "-------------------------"
echo "Updating and Upgrading Packages"
echo "-------------------------"
if [[ $FAMILY == "debian" ]]; then
    sudo apt update -y && sudo apt upgrade -y
elif [[ $FAMILY == "fedora" ]]; then
    sudo dnf update -y
elif [[ $FAMILY == "arch" ]]; then
    sudo pacman -Syu --noconfirm
elif [[ $FAMILY == "suse" ]]; then
    sudo zypper refresh && sudo zypper update -y
fi

# Start and enable Docker service
echo "-------------------------"
echo "Starting Docker Service"
echo "-------------------------"
sudo systemctl enable --now docker || echo "[WARN] Could not enable Docker service"

# Verify installation
clear
echo "-------------------------"
echo "Verify Docker Installation"
echo "Check if there is output on the next line!"
echo "-------------------------"
sudo docker run hello-world
echo "-------------------------"
echo "🎉 Script Complete! Docker is installed! 🎉"
echo "-------------------------"
