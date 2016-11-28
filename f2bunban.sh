#!/bin/bash
#ask for variables
echo "=====Jail?====="
read jail
echo "=====IP?====="
read ip
#f2b command
fail2ban-client set $jail unbanip $ip

#this will append IP to be whitelisted to fail2ban config file at /etc/fail2ban/jail.local, as per f2b docs, this is the file that should be modified.
read -p "=====Whitelist (y/n)?=====" -n 1 -r
        echo

if [[ "$REPLY" == "y" ]]

then
        sed -i "s/\bignoreip = \b/&$ip /" /etc/fail2ban/jail.local
        echo "=====Done====="
else
        echo
        echo "=====Done====="
fi


> /dev/null ;
