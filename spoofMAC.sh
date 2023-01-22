#!/bin/bash
IFACE="en0"

while [ true ]
do
	newComputerName="$(openssl rand -hex 8)"
	newLocalHostName="$(openssl rand -hex 8)"
	newHostName="$(openssl rand -hex 8)"
	newNetBIOSName="$(openssl rand -hex 8)"
	
	scutil --set ComputerName "$newComputerName"
	scutil --set LocalHostName "$newLocalHostName"
	scutil --set HostName "$newHostName"
	defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName $newNetBIOSName
	
	dscacheutil -flushcache
	
	currentComputerName="$(scutil --get ComputerName)"
	currentLocalHostName="$(scutil --get LocalHostName)"
	currentHostName="$(scutil --get HostName)"
	currentNetBIOSName="$(defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName)"
	
	if [ "$currentComputerName" = "$newComputerName" ] && [ "$currentLocalHostName" = "$newLocalHostName" ] && [ "$currentHostName" = "$newHostName" ] && [ "$currentNetBIOSName" = "$newNetBIOSName" ]
	then
		echo "Name(s) changed. ComputerName: $currentComputerName | LocalHostName: $currentLocalHostName | HostName: $currentHostName | NetBIOSName: $currentNetBIOSName"
		break
	fi
	sleep 1
done

while [ true ]
do
	MAC="$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')"
	sudo ifconfig $IFACE ether $MAC
	ETHER="$(echo $(ifconfig $IFACE|grep ether) | cut -d' ' -f2)"
	if [ "$ETHER" = "" ]
	then
		echo "Interface is down"
	elif [ "$ETHER" = "$MAC" ]
	then
		echo "MAC address changed to $ETHER"
		break
	fi
	sleep 1
done
