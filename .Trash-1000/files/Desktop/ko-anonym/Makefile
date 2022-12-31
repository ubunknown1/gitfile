default: help

.PHONY: help
help: # Viser hjelp for hver Makefile commando.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: install
install: # Installerer nødvendige program.
	sudo apt install -y tor macchanger curl virt-what


.PHONY: build
build: # Kopierer over Filer.
	sudo cp anonym /usr/sbin/anonym
	sudo cp ko-anonym /etc/default/ko-anonym
	sudo chmod +x /usr/sbin/anonym
	sudo chmod +x /etc/default/ko-anonym

