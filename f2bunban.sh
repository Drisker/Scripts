#!/bin/bash

echo "Jail?"
read jail
echo "IP?"
read ip

fail2ban-client set $jail unbanip $ip

#this will append IP to be whitelisted to fail2ban config file at /etc/fail2ban/jail.local, as per f2b docs, this is the file that should be modified.
echo "whitelist? y/n"
read whitelist

if [[ "whitelist" == "y" ]]
# -i = infile edit , \b = zero-width word boundary , & = refer to that portion of the pattern. Refer to sed manual.
then sed -i 's/\bignoreip = \b/&$ip /' /etc/fail2ban/jail.local
else echo "Done"
fi
> /dev/null ;
