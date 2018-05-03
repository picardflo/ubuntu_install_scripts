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
		apt install filezilla --yes
		apt install mc --yes
		apt install vlc --yes
		apt install cifs-utils --yes
		apt install nfs-utils --yes
		apt install ssh --yes
		apt install conky --yes
		apt install gpodder --yes
		apt install remmina --yes
		apt install remmina-plugin-* --yes
		apt install vim --yes
		apt install git --yes
		apt install tree --yes
		apt install zip --yes
		apt install nmap --yes
		apt install htop --yes
		apt install digikam --yes
		apt install shotwell --yes
		apt install gparted --yes
		apt install make --yes
		apt install gcc --yes
		apt install slurm --yes
		apt install zip --yes
		apt install keepass2 --yes
		apt install bmon --yes
		apt install iftop --yes
		apt install dos2unix --yes
		apt install mysql-client --yes
		apt install packagekit --yes
		apt install apt-transport-https --yes
		apt install hplip --yes
		apt install hardinfo --yes
		apt install redshift-gtk --yes
		apt install easytag --yes
		apt install brasero --yes
		apt install acpi --yes
		apt install xpad --yes
		apt install bleachbit --yes
		apt install screenfetch --yes


		# Check version and install tools by desktop env.
		if [ $(pgrep -c gnome-panel) -gt 0 ];
		then
			apt install unity-tweak-tool --yes	
		else
			apt install gnome-tweak-tool --yes
		
		fi


   		## From ppa or externa Repositories

		# Chrome (stable)
		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
		sh -c ‘echo « deb https://dl.google.com/linux/chrome/deb/ stable main » > /etc/apt/sources.list.d/google-chrome.list’
		apt update
                apt install google-chrome-stable --yes

		# Atom
		add-apt-repository ppa:webupd8team/atom --yes
		apt update
		apt install atom --yes

		# Peek - Screen Recorder (Gif)
		sudo add-apt-repository ppa:peek-developers/stable --yes
		sudo apt update
		sudo apt install peek --yes

		# grub-customizer
		add-apt-repository --yes ppa:danielrichter2007/grub-customizer
		apt update &&  apt install --yes grub-customizer

		# install conky Manager
		add-apt-repository ppa:teejee2008/ppa --yes
		apt update
		apt install conky-manager --yes


		# install HandBrake
		apt-add-repository ppa:stebbins/handbrake-releases --yes
		apt update
		apt install handbrake --yes
		# simple library designed for accessing DVDs like a block device without having to bother about the decryption (DRM bypass)
		#apt install libdvdcss2 --yes

		# virtualbox
		sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -c -s) contrib" > /etc/apt/sources.list.d/oracle-virtualbox5.list'
		wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
		wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
		apt update
		apt install virtualbox-5.1 --yes


		#Caffeine
		add-apt-repository ppa:caffeine-developers/ppa --yes
		apt-get update
		apt install caffeine --yes

		#qownnotes
		add-apt-repository ppa:pbek/qownnotes --yes
		apt-get update
		apt-get install qownnotes --yes

		#
		add-apt-repository ppa:nextcloud-devs/client
		apt-get update
		apt-get install nextcloud-client --yes

		echo "+------------------------------------------------------------+"
		echo "| Update OS and clean OS                                     |"
		echo "+------------------------------------------------------------+"
		sleep 5

		# Update OS
		apt update
		apt upgrade --yes
		apt autoclean --yes
		apt autoremove --yes


		echo "+------------------------------------------------------------+"
		echo "| Reboot if required                                         |"
		echo "+------------------------------------------------------------+"
		sleep 5

		if [ -f /var/run/reboot-required ]; then
			echo ' Redemarrage dans 10 secondes - Ctrl+C pour annuler'
			secondes=10
			for i in $(seq $secondes -1 1); do
    				echo "$i seconds to reboot...";
    				sleep 1;
			done;
			echo "reboot now!"
			reboot
		fi

else
	echo "Vous devez etre root (ou Sudo) pour executer ce script"
	exit 2
fi
