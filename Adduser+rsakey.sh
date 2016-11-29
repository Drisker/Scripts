#!/bin/bash

#A script to simplify creating system or regular user with ssh-rsa auth
echo "Name?"
read name

read -p "Create user (r/s)" -n 1 -r        # regular/system user
echo

if [[ "$REPLY" == "s" ]]
then
        echo "Creating system user"
        useradd -M $name #no home dir
        usermod -L $name #lock logging in unless root
else
        echo "Creating regular user"
        adduser --gecos "" $name #all prompts eg. name filled with blanks
        read -p "Generate ssh-rsa key(y/n)?: " -n 1 -r
        echo
        if [[ "$REPLY" == "y" ]]
        then
                echo "Passphrase(optional): "
                read -s pass #mask pass
                cd /etc/ssh/keys
                ssh-keygen -q -b 4096 -N "$pass" -f $name
                mkdir -p /home/$name/.ssh
                cat $name.pub > /home/$name/.ssh/authorized_keys
                echo "Please deliver private key stored in /etc/ssh/keys to desired user over secure channel to permit log-in"
                echo "Done"
        else    echo "Done"
        fi
fi

> /dev/null ;