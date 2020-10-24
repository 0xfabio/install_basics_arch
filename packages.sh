#!/bin/sh

echo "Installing Packages"
sudo pacman -S git vim htop neofetch feh xorg-server xorg-xinit libxft libxinerama nerd-fonts-fira-mono picom xf86-video-intel wget base-devel && echo "Packages successfully installed!!" || echo "Packages could not be installed.."j

echo "Cloning Suckless Utils"
cd /usr/src
sudo git clone https://github.com/0xfabio/dwm_fork.git 
sudo git clone https://github.com/0xfabio/st_fork.git 
sudo git clone https://github.com/0xfabio/slstatus_fork.git 
sudo git clone https://git.suckless.org/dmenu

echo "Suckless Utils Cloned !! "
echo "Now making and installing them.."
cd dwm_fork
sudo make && sudo make install && echo "dwm installed!"
cd ../st_fork
sudo make && sudo make install && echo "st installed!"
cd ../slstatus_fork
sudo make && sudo make install && echo "slstatus installed!"
cd ../dmenu
sudo make && sudo make install && echo "dmenue installed!"

cd 
cd .config || mkdir .config && cd .config
cd picom || mkdir picom && cd picom
wget https://raw.githubusercontent.com/0xfabio/picom_conf/main/picom.conf
echo "Installed picom config"
cd ..
mkdir wallpaper && cd wallpaper
git clone https://github.com/0xfabio/wallpapers.git
cp wallpapers/1.jpg wall.jpg
echo "Wallpapers installed now setting first"
feh --bg-scale wall.jpg

echo "Creating .xinitrc"
cd
touch ~/.xinitrc
echo "~/.fehbg &" >> .xinitrc
echo "picom &" >> .xinitrc
echo "exec slstatus &" >>.xinitrc
echo "exec dwm" >> .xinitrc


