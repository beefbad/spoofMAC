#!/bin/bash
sudo launchctl unload -w /Library/LaunchDaemons/com.beefbad.spoofMAC.plist
sudo launchctl remove -w /Library/LaunchDaemons/com.beefbad.spoofMAC.plist
sudo rm -rfv /Library/LaunchDaemons/com.beefbad.spoofMAC.plist
