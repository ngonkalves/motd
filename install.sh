#!/usr/bin/env bash

if [[ $(id -u) -ne 0 ]] ; then echo "This script must be ran as root!!!" ; exit 1 ; fi

if [ -x /etc/update-motd.d/ ]; then
    while true
    do
        echo -e "\nThis will install a custom motd into /etc/update-motd.d/.\n"
        read -r -p "Are you sure you want to continue? [Yes/No] " input

        case $input in
        [yY][eE][sS]|[yY])
            # backslash is to avoid alias usage
            echo -e "\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
            \chmod -v -x /etc/update-motd.d/*
            echo -e "\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
            \cp -v -p ./etc/update-motd.d/* /etc/update-motd.d
            echo -e "\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
            \chown -v root:root /etc/update-motd.d/*
            echo -e "\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
            \ls -la --color /etc/update-motd.d/
            echo -e "\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
            echo -e "\nDone!!!"
            break
            ;;
        [nN][oO]|[nN])
            echo -e "\nScript will now exit..."
            break
            ;;
        *)
            echo "invalid option"
            ;;
        esac
    done
else
    echo "Folder /etc/update-motd.d/ does not exist, cannot continue..."
    exit 2
fi
