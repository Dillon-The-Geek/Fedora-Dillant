echo "What Web browser would you like?
1 - brave
2 - chromium

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
	sudo dnf install dnf-plugins-core

	sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.c>

	sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

	sudo dnf install brave-browser
elif [[ $chosen_browser == "chromium" ]]; then
	sudo dnf install chromium
fi
