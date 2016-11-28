#!/bin/bash

#Simple script to send mail using mailgun.
#Fill out API_KEY found in your mailgun dashboard
#and edit YOUR_DOMAIN with your own

CURL=/usr/bin/curl


echo Sender:
read FROM

echo Recipient:
read TO

echo Subject:
read SUBJECT

echo Message:
read TEXT




API_KEY=
API_ENDPOINT="https://api.mailgun.net/v3/YOUR_DOMAIN/messages"

$CURL -sk \
 -F from="$FROM" \
 -F to="$TO" \
 -F subject="$SUBJECT" \
 -F text="$TEXT" \
 --user "api:$API_KEY" \
 $API_ENDPOINT \
> /dev/null ;
