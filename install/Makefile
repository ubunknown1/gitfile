
default: help

.PHONY: help
help: # Viser hjelp for hver Makefile commando.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done




.PHONY: install
install: # Installerer nødvendige program.
	sudo apt install -y virt-what libglvnd-dev pkg-config nautilus-admin plymouth-themes software-properties-common build-essential gnupg gnupg1 gnupg2 kgpg git gh ubuntu-restricted-extras openssh-client openssh-server ufw guake tor python3.10-full snap snapd timeshift gnome-tweaks gcc g++ openjdk-18-jre-headless gedit macchanger iw bleachbit python3.10-full libglvnd-dev pkg-config python3-pip


.PHONY: build
build: # Kopierer over Filer.
	SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
	echo "$SCRIPTPATH"

	sudo cp anonym /usr/sbin/anonym
	sudo cp ko-anonym /etc/default/ko-anonym
	sudo chmod +x /usr/sbin/anonym
	sudo chmod +x /etc/default/ko-anonym

.PHONY:
full-config:
