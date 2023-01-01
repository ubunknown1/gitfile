#!/bin/sh


mac_change() {
	iface=$(ip addr show scope global | grep inet | awk '/noprefixroute/ {noprefixroute=$9} END {print noprefixroute}'
)
	gammelmac=$(cat /sys/class/net/$iface/address)
	sudo systemctl stop NetworkManager.service
	sudo macchanger -r "$iface"
	sudo systemctl start NetworkManager.service
	clear -x
	nymac=$(cat /sys/class/net/$iface/address)
        if [ "$nymac" = "$gammelmac" ]; then
        	clear -x
        	echo "$re Mac Adressen ble IKKE endret"
		echo ""
        	echo "Mac må endres for å kunne surfe annonymt $cf"


        else
                echo "$gr 	Vellykket! $cf"
                echo ""
                echo "$bl gammle Mac Addresse:"
                echo "$re 	$gammelmac $cf"
                echo "$bl Ny Mac Addresse:"
                echo "$gr 	$nymac $gr"
		
	fi
}

full_upgrade() {
	echo "kjører update"
	sudo apt update >/dev/null 2>&1
        echo "kjører upgrade"
	sudo apt upgrade -y >/dev/null 2>&1
        echo "kjører full-upgrade"
	sudo apt full-upgrade -y >/dev/null 2>&1
        echo "kjøerer dist-update"
	sudo apt dist-upgrade -y >/dev/null 2>&1
        echo "Oppdaterer System"
	sudo apt autoremove -y >/dev/null 2>&1
        echo "Oppdaterer System"
	sudo apt clean >/dev/null 2>&1
	echo "stopper Snap Store Prosses"
	killall snap-store >/dev/null 2>&1
	echo "oppdaterer snap store"
	snap refresh >/dev/null 2>&1
	echo "grub update"
	sudo update-grub >/dev/null 2>&1
	echo "initramfs update"
	sudo update-initramfs -u >/dev/null 2>&1
	echo ""
	echo "opdatering fullført"
}


full_upgrade
