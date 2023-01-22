#!/bin/bash
chmod +x spoofMAC.sh
sudo cp -R com.dev.spoofMAC.plist /Library/LaunchDaemons/com.dev.spoofMAC.plist
sudo chown root:wheel /Library/LaunchDaemons/com.dev.spoofMAC.plist
sudo launchctl load -w /Library/LaunchDaemons/com.dev.spoofMAC.plist