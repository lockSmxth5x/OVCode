#!/bin/sh

# Update package lists and upgrade packages
apt update && apt full-upgrade -y

# Install net-tools and ubuntu-restricted-extras
apt install net-tools ubuntu-restricted-extras -y

# Restart ALL services if prompted
# If asked to reboot, do it before installing OpenVPN Access Server to run with the new kernel
# Use arrow keys and space to select services, then tab to go to yes/no options and click yes from there

# Add OpenVPN Access Server repository GPG key
wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -

# Add OpenVPN Access Server repository to sources list
echo "deb http://as-repository.openvpn.net/as/debian noble main" > /etc/apt/sources.list.d/openvpn-as-repo.list

# Update package lists
apt update

# Install OpenVPN Access Server
apt install openvpn-as -y
