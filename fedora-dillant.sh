#!/bin/bash

#download and set wallpaper

wget "https://w.wallhaven.cc/full/zy/wallhaven-zy2x7v.png"

mv wallhaven-zy2x7v.png ~/Pictures/

gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/Pictures/wallhaven-zy2x7v.png

#enable rpm fusion

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf config-manager --enable fedora-cisco-openh264


