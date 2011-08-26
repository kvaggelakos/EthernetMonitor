#!/bin/sh
if ifconfig en0 | grep "status: active"; then
        if ifconfig en1 | grep "status: active"; then
                networksetup -setairportpower en1 off
                if [ -f "/usr/local/bin/growlnotify" ]; then
                    /usr/local/bin/growlnotify -m "Shut down Wi-Fi, entering Cable mode!"
                fi
        fi
elif ifconfig en0 | grep "status: inactive"; then
        if ifconfig en1 | grep "status: inactive"; then
            networksetup -setairportpower en1 on
            if [ -f "/usr/local/bin/growlnotify" ]; then
                /usr/local/bin/growlnotify -m "Cable removed, starting Wi-fi again!"
            fi
        fi
else
    exit 0
fi