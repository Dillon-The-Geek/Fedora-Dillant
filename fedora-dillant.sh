#!/bin/bash

#download and set wallpaper

wget "https://w.wallhaven.cc/full/zy/wallhaven-zy2x7v.png"

mv wallhaven-zy2x7v.png ~/Pictures/

gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/Pictures/wallhaven-zy2x7v.png

#enable rpm fusion

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf config-manager --enable fedora-cisco-openh264

#install brave 


sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-browser

#install media apps

sudo dnf install discord

sudo dnf install obs-studio

#install flatpak and add flathub 

sudo dnf install flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo    

#timeshift

sudo dnf install timeshift

#gaming

sudo dnf install steam

sudo dnf install lutris

sudo dnf install mangohud

sudo dnf install goverlay

#shotcut

mkdir AppImages

wget "https://sourceforge.net/projects/shotcut/files/v23.12.15/shotcut-linux-x86_64-231215.AppImage/download"

mv shotcut-linux-x86_64-231215.AppImage ~/AppImages

#neofetch

sudo dnf install neofetch

echo "neofetch" >> .bashrc

reboot
