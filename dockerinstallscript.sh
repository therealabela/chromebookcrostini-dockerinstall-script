#!/bin/bash
# ============================================
# Universal Docker Installer Script (Unofficial)
# Author: therealabela | github.com/therealabela
# Works on Debian/Ubuntu, Fedora/RHEL/CentOS, Arch/Manjaro, openSUSE/SUSE derivatives
# ============================================

# Show big fat warning
clear
echo "====================================================="
echo "⚠️ WARNING ⚠️"
echo "I am NOT affiliated with https://www.docker.com/ or its creators."
echo "This script is a personal project and completely unofficial!"
echo "I just want to make it easier for people to install Docker."
echo "====================================================="
echo
read -p "Press Enter to continue or Ctrl+C to cancel..."

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

# Normalize OS family
case "$OS" in
    debian|ubuntu) FAMILY="debian" ;;
    fedora|rhel|centos) FAMILY="fedora" ;;
    arch|manjaro) FAMILY="arch" ;;
    opensuse*|sles) FAMILY="suse" ;;
esac

# Update & Install Docker
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

# Add user to docker group
echo "-------------------------"
echo "Configuring Docker Permissions"
echo "-------------------------"
sudo groupadd docker 2>/dev/null || true
sudo usermod -aG docker $USER
echo "[INFO] You may need to log out and log back in for group changes to take effect."

# Verify installation
clear
echo "-------------------------"
echo "Verify Docker Installation"
echo "-------------------------"
if sudo docker run hello-world >/dev/null 2>&1; then
    echo "✅ Docker is working correctly!"
else
    echo "⚠️ Docker installation completed, but the hello-world test failed."
    echo "   Try running: sudo docker run hello-world"
fi

echo "-------------------------"
echo "🎉 Script Complete! Docker is installed! 🎉"
echo "-------------------------"
