#!/bin/bash
DIR=$(pwd)
sudo echo -n -e "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>Label</key>\n\t<string>com.beefbad.spoofMAC</string>\n\t<key>LaunchOnlyOnce</key>\n\t<dict>\n\t\t<key>NetworkState</key>\n\t\t<true/>\n\t</dict>\n\t<key>RunAtLoad</key>\n\t<true/>\n\t<key>WorkingDirectory</key>\n\t<string>$DIR</string>\n\t<key>ProgramArguments</key>\n\t<array>\n\t\t<string>$DIR/spoofMAC.sh</string>\n\t</array>\n\t<key>UserName</key>\n\t<string>root</string>\n\t<key>StandardErrorPath</key>\n\t<string>$DIR/Logs/spoofMAC.log</string>\n\t<key>StandardOutPath</key>\n\t<string>$DIR/Logs/spoofMAC.log</string>\n</dict>\n</plist>\n">/Library/LaunchDaemons/com.beefbad.spoofMAC.plist
mkdir $DIR/Logs
chmod +x spoofMAC.sh
sudo chown root:wheel /Library/LaunchDaemons/com.beefbad.spoofMAC.plist
sudo launchctl load -w /Library/LaunchDaemons/com.beefbad.spoofMAC.plist
