#!/bin/bash

###################################################################
##    .:: Script d'installation Poste fpicard-ubuntu-pc ::.      ##
###################################################################
#                                                                 #
##            .:: Script by Florian PICARD ::.                   ##
###################################################################

if [ $(id -u) -eq 0 ];
	then

		echo "+------------------------------------------------------------+"
		echo "| Install Tools and Softwares                                |"
		echo "+------------------------------------------------------------+"
		sleep 5

		## From official Ubuntu Repositories
		apt install filezilla -y
		apt install mc -y
		apt install vlc -y
		apt install cifs-utils -y
		apt install ssh -y
		apt install conky -y
		apt install gpodder -y
		apt install remmina -y
		apt install remmina-plugin-* -y
		apt install vim -y
		apt install git -y
		apt install tree -y
		apt install zip -y
		apt install nmap -y
		apt install htop -y
		apt install digikam -y
		apt install shotwell -y
		apt install gparted -y
		apt install make -y
		apt install gcc -y
		apt install slurm -y
		apt install zip -y
		apt install keepass2 -y
		apt install bmon -y
		apt install iftop -y
		apt install dos2unix -y
		apt install mysql-client -y
		apt install packagekit -y
		apt install apt-transport-https -y
		apt install hplip -y
		apt install hardinfo -y
		apt install redshift-gtk -y
		apt install easytag -y
		apt install brasero -y
		apt install acpi -y
		apt install xpad -y
		apt install unity-tweak-tool -y


    ## From ppa or externa Repositories

		# Chrome (stable)
		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
		sh -c ‘echo « deb https://dl.google.com/linux/chrome/deb/ stable main » > /etc/apt/sources.list.d/google-chrome.list’
		apt update
                apt install google-chrome-stable -y

		# Atom
		add-apt-repository ppa:webupd8team/atom --yes
		apt update
		apt install atom -y

		# Peek - Screen Recorder (Gif)
		sudo add-apt-repository ppa:peek-developers/stable --yes
		sudo apt update
		sudo apt install peek -y

		# grub-customizer
		add-apt-repository --yes ppa:danielrichter2007/grub-customizer
		apt update &&  apt install -y grub-customizer

		# install conky Manager
		add-apt-repository ppa:teejee2008/ppa --yes
		apt update
		apt install conky-manager -y


		# install HandBrake
		apt-add-repository ppa:stebbins/handbrake-releases --yes
		apt update
		apt install handbrake -y
		# simple library designed for accessing DVDs like a block device without having to bother about the decryption (DRM bypass)
		#apt install libdvdcss2 -y

		# virtualbox
		sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -c -s) contrib" > /etc/apt/sources.list.d/oracle-virtualbox5.list'
		wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
		wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
		apt update
		apt install virtualbox-5.1 -y


		#Caffeine
		add-apt-repository ppa:caffeine-developers/ppa --yes
		apt-get update
		apt install caffeine -y

		echo "+------------------------------------------------------------+"
		echo "| Update OS and clean OS                                     |"
		echo "+------------------------------------------------------------+"
		sleep 5

		# Update OS
		apt update
		apt upgrade -y
		apt autoclean -y
		apt autoremove -y


		echo "+------------------------------------------------------------+"
		echo "| Reboot if required                                         |"
		echo "+------------------------------------------------------------+"
		sleep 5

		if [ -f /var/run/reboot-required ]; then
			echo ' Redemarrage dans 10 secondes - Ctrl+C pour annuler'
			sleep 10
			reboot
		fi

else
	echo "Vous devez etre root (ou Sudo) pour executer ce script"
	exit 2
fi
