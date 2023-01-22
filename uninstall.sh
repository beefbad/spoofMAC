#!/bin/bash
sudo launchctl unload -w /Library/LaunchDaemons/com.dev.spoofMAC.plist
sudo launchctl remove -w /Library/LaunchDaemons/com.dev.spoofMAC.plist
sudo rm -rfv /Library/LaunchDaemons/com.dev.spoofMAC.plist
