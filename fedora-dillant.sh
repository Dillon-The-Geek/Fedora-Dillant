#!/bin/bash

#By Dillon King

#apple dnf config

cp /etc/dnf/dnf.conf ~/

mv dnf.conf dnf.txt

echo "   " >> dnf.txt

echo "#for speed" >> dnf.txt

echo "max_parallel_downloads=10" >> dnf.txt 

echo "fastestmirror=True" >> dnf.txt

echo "defaultyes=True" >> dnf.txt 

sudo mv dnf.txt dnf.conf

sudo rm /etc/dnf/dnf.conf

sudo mv dnf.conf /etc/dnf/

#update system

sudo dnf update -y

sudo dnf upgrade -y

#download and set wallpaper

wget "https://w.wallhaven.cc/full/zy/wallhaven-zy2x7v.png"

mv wallhaven-zy2x7v.png ~/Pictures/

gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/Pictures/wallhaven-zy2x7v.png

#enable dark mode 

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

#enable rpm fusion

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf config-manager --enable fedora-cisco-openh264 -y

#install web browser

echo "What Web browser would you like?
1 - brave
2 - chromium"

read browser

case $browser in

	1)
		chosen_browser="brave"
		;;
	
	2)
		chosen_browser="chromium"
		;;
esac

if [[ $chosen_browser == "brave" ]]; then
	sudo dnf install dnf-plugins-core -y

	sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -y

	sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

	sudo dnf install brave-browser -y
elif [[ $chosen_browser == "chromium" ]]; then
	sudo dnf install chromium -y
fi


#install media apps

sudo dnf install discord -y

sudo dnf install obs-studio -y

#install flatpak and add flathub 

sudo dnf install flatpak -y

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo    

 

#spotify

flatpak install flathub com.spotify.Client -y

#timeshift

sudo dnf install timeshift -y

#gaming

sudo dnf install steam -y

sudo dnf install lutris -y

sudo dnf install mangohud -y

sudo dnf install goverlay -y

#shotcut

mkdir AppImages

wget "https://sourceforge.net/projects/shotcut/files/v23.12.15/shotcut-linux-x86_64-231215.AppImage/download"

chmod +x download

mv download AppImages/

#neofetch

sudo dnf install neofetch -y

echo "neofetch" >> .bashrc

reboot
