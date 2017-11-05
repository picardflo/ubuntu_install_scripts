#!/bin/bash

if [ $(id -u) -eq 0 ]; then
	platform='unknown'
	unamestr=$(lsb_release -i -s)

	if [[ "$unamestr" == 'Ubuntu' ]]; then
   		platform='Ubuntu'
   		echo ""
   		echo "detected plateform : $platform"
   		echo ""
   
   		# Install git
   		apt update && apt install git
   
   		# Get agent
   		git clone https://github.com/librenms/librenms-agent.git /opt/librenms-agent
   		# Copy BIN
   		cp /opt/librenms-agent/check_mk_agent /usr/bin/check_mk_agent
   		chmod +x /usr/bin/check_mk_agent

    		# Create Service
    		cp /opt/librenms-agent/check_mk@.service /opt/librenms-agent/check_mk.socket /etc/systemd/system

    		# Create plugin folder
    		mkdir -p /usr/lib/check_mk_agent/plugins /usr/lib/check_mk_agent/local

    		# Enable agent (on startup) & start it
    		systemctl enable check_mk.socket && systemctl start check_mk.socket

    		# check service
    		systemctl status check_mk.socket



	elif [[ "$unamestr" == 'Debian' ]]; then
   		platform='Debian'
   		echo ""
   		echo "detected plateform : $platform"
   		echo ""
   		# Install git
   		apt update && apt install git
   
   		# Get agent
   		git clone https://github.com/librenms/librenms-agent.git /opt/librenms-agent
   		# Copy BIN
   		cp /opt/librenms-agent/check_mk_agent /usr/bin/check_mk_agent
   		chmod +x /usr/bin/check_mk_agent

    		# Create Service
    		cp /opt/librenms-agent/check_mk@.service /opt/librenms-agent/check_mk.socket /etc/systemd/system

   		 # Create plugin folder
    		mkdir -p /usr/lib/check_mk_agent/plugins /usr/lib/check_mk_agent/local

    		# Enable agent (on startup) & start it
    		systemctl enable check_mk.socket && systemctl start check_mk.socket

    		# check service
    		systemctl status check_mk.socket
	else
		platform='unknown'
		echo ""
   		echo "detected plateform : $platform - exit script"
   		echo ""
		exit
	fi
else
	        echo "Vous devez etre root (ou Sudo) pour executer ce script"
		exit 2

fi
