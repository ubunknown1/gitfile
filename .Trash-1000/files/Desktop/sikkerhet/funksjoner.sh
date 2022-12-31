#!/bin/sh

clear -x
cf='\033[0m'
re='\033[0;31m'
gr='\033[0;32m'
ye='\033[0;33m'
bl='\033[0;34m'
pu='\033[0;35m'
cy='\033[0;36m'
wh='\033[0;37m'


# Change the local hostname
change_hostname() {
	
	echo

	CURRENT_HOSTNAME=$(hostname)

	clean_dhcp

	RANDOM_HOSTNAME=$(shuf -n 1 /etc/dictionaries-common/words | sed -r 's/[^a-zA-Z]//g' | awk '{print tolower($0)}')

	NEW_HOSTNAME=${1:-$RANDOM_HOSTNAME}

	echo "$NEW_HOSTNAME" > /etc/hostname
	sed -i 's/127.0.1.1.*/127.0.1.1\t'"$NEW_HOSTNAME"'/g' /etc/hosts

	echo " * $bl Starter hostname service $cf"
	systemctl start hostname 2>/dev/null
	to_sleep

	if [ -f "$HOME/.Xauthority" ] ; then
		su "$SUDO_USER" -c "xauth -n list | grep -v $CURRENT_HOSTNAME | cut -f1 -d\ | xargs -i xauth remove {}"
		su "$SUDO_USER" -c "xauth add $(xauth -n list | tail -1 | sed 's/^.*\//'$NEW_HOSTNAME'\//g')"
		echo " * X authority file updated"
	fi
	
	avahi-daemon --kill 2>/dev/null

	echo "$bl * PC navn endret til $NEW_HOSTNAME $gr"
}

change_hostname
