#!/bin/bash

OLD_IP="/home/adam.selker/Temp/ip_addr"

if [ -f $OLD_IP ]
then
	NEW_IP=$(ip route get 8.8.8.8 | grep -oP 'src \K[^ ]+')
	if [ `cat $OLD_IP` = $NEW_IP ]
	then
		#echo "no change in IP."
		true
	else
		echo "Subject: $(hostname) now $NEW_IP" | /usr/sbin/sendmail adamselker@gmail.com && echo $NEW_IP > $OLD_IP
	fi
else
	echo $NEW_IP > $OLD_IP
fi
