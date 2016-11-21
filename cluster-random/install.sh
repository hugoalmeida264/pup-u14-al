#!/bin/bash

# test if port 80 is alrea host port
clear
{
exec 6<>/dev/tcp/127.0.0.1/80
} &> /dev/null
if [ $? -eq 0 ]
then
	echo "Port http://localhost:80 is already in use at this host,"
	echo "please change Vagrantfile configuration in line"i
	echo "'config.vm.network "forwarded_port", guest: 80, host: 80'"
	echo "on the host: 80 to something else, ex. '8080'"
	echo "you can use this command 'exec 6<>/dev/tcp/127.0.0.1/8080'"
	echo "to verify if that port is available at this Vagrant host" 
	echo "script will now stop, bye for now..."
	exit 0

	
else
	echo "Port 80 is available in this host, OK!"
fi

sudo vagrant up --provision
