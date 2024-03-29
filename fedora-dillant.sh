#!/bin/bash

#By Dillon-The-Geek

cd

#check they are in home directory

path=$(pwd)

if [[ $path == "/home/$USER" ]]; then
	echo "running the script"
else
	echo "this script must be in your home folder"
	exit 1
fi 

echo "####################"
echo "# Making dnf Faster#"
echo "####################"

#apply dnf config

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

#message updating

echo "#######################"
echo "# Updating the system #"
echo "#######################"

sleep 1

#update system

sudo dnf upgrade -y

#message wallpaper and theme

echo "###############################"
echo "# Setting wallpaper and Theme #"
echo "###############################"

sleep 1


#download and set wallpaper

wget "https://w.wallhaven.cc/full/zy/wallhaven-zy2x7v.png"

mv wallhaven-zy2x7v.png ~/Pictures/

gsettings set org.gnome.desktop.background picture-uri-dark file:///home/$USER/Pictures/wallhaven-zy2x7v.png

#enable dark mode 

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

#message enabling rpm fusion

echo "#######################"
echo "# Enabling RPM Fusion #"
echo "#######################"

sleep 1


#enable rpm fusion

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf config-manager --enable fedora-cisco-openh264 -y

#message install flatpak and flathub

echo "##################################"
echo "# Installing flatpak and flathub #"
echo "##################################"

sleep 1

#install flatpak and add flathub 

sudo dnf install flatpak -y

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 

#message installing web browser

echo "##########################"
echo "# Installing Web Browser #"
echo "##########################"

sleep 1

#install web browser

echo "What Web browser would you like?
1 - brave
2 - chromium
3 - floorp"

read browser

case $browser in

	1)
		chosen_browser="brave"
		;;
	
	2)
		chosen_browser="chromium"
		;;
	
	3)
		chosen_browser="floorp"
		;;

esac

if [[ $chosen_browser == "brave" ]]; then
	sudo dnf install dnf-plugins-core -y

	sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -y

	sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

	sudo dnf install brave-browser -y
elif [[ $chosen_browser == "chromium" ]]; then
	sudo dnf install chromium -y
elif [[ $chosen_browser == "floorp" ]]; then
	flatpak install flathub one.ablaze.floorp -y
fi

 
#message installing desktop enviremont

echo "#################################"
echo "# Installing Desktop Enviremont #"
echo "#################################"

sleep 1

#installing desktop enviremont

echo "What desktop enviremont would you like?
1 - Gnome(default)
2 - KDE Plasma"

read desktop

case $desktop in

	1)
		chosen_desktop="gnome"
		;;

	2)
		chosen_desktop="kde"
		;;

esac

if [[ $chosen_desktop == "gnome" ]]; then
	echo "Keeping gnome"
elif [[ $chosen_desktop = "kde" ]]; then
	sudo dnf install @kde-desktop -y
	sudo systemctl set-default graphical.target
	sudo systemctl disable gdm
	sudo systemctl enable sddm
fi

#message installing apps

echo "###################"
echo "# Installing Apps #"
echo "###################"

sleep 1

#programming


flatpak install flathub com.visualstudio.code -y


#install media apps


sudo dnf install obs-studio -y

#spotify and discord

flatpak install flathub com.spotify.Client -y

flatpak install flathub com.discordapp.Discord -y

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

cd AppImages

mv download shotcut

#disk

sudo dnf install gparted -y



#message setting up neofetch

echo "##########################"
echo "#   Setting Up Neofetch  #"
echo "##########################"

sleep 1


#neofetch

sudo dnf install neofetch -y

echo "neofetch" >> .bashrc


#message setting up firewall

echo "##########################"
echo "#   Setting Up Firewall  #"
echo "##########################"

sleep 1

#setup Firewall

sudo dnf install ufw -y

sudo systemctl enable ufw.service --now

#message script complete

echo "##########################"
echo "#   Script Complete      #"
echo "##########################"

echo "##########################"
echo "#      Rebooting now     #"
echo "##########################"

reboot
