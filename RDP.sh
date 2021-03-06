#! /bin/bash
printf "Installing RDP Be Patience... " >&2
{
sudo useradd -m HNM
sudo adduser HNM sudo
echo 'HNM:7712' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser HNM chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occurred " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - HNM -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
#! Add some side-load soft here

#! Insync
#! wget https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.3.5.40925-bionic_amd64.deb
#! sudo dpkg --install insync_3.3.5.40925-bionic_amd64.deb

#! Sys-monitor
sudo apt-get install gnome-system-monitor

#! XDM
#wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz
#sudo tar -xJf xdm-setup-7.2.11.tar.xz
#sudo bash install.sh

#! Media Info
sudo apt-get install mediainfo mediainfo-gui


if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi
