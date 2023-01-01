#!/bin/sh


path() {
	SCRIPT=$(realpath -s "$0")
	SCRIPTPATH=$(dirname "$SCRIPT")
	echo "$SCRIPT"
	echo "$SCRIPTPATH"
}

change_mac() {
	iface=$(iw dev | awk '/Interface/ {interf=$2} END {print interf}')
	currentmac=$(cat /sys/class/net/$iface/address)
	sudo service NetworkManager stop
	sleep 1
	sudo macchanger -r "$iface" | tail -n 1 | sed 's/  //g'
	sleep 1
	sudo service NetworkManager restart
	newmac=$(cat /sys/class/net/$iface/address)
	echo "$newmac"
        if [ "$checkmac" = "$newmac" ]; then
        	echo "something went wrong"
                echo "Mac Address Is NOT Spoofed!"
                echo "Fix the Problem Now!"
        else
        	clear
                echo "Mac Address is successfully Changed"
                echo ""
                echo "old Mac Address is $currentmac"
                echo "new Mac Address is $newmac"
	fi
}


while true; do
    read -p "vil du installere Default apt packages? (y/n) " yn
    case $yn in
        [Yy]* )
           change_mac
           break;;
        [Nn]* )
           echo "lastet ikke ned pakker"
           exit;;
        * ) echo "velg y eller n.";;

    esac
done
