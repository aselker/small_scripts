#!/bin/bash

OLD_IP="/home/adam.selker/Temp/ip_addr"

 if [ -f $OLD_IP ]
 then
	 if [ `cat $OLD_IP` = `ip route get 8.8.8.8 | grep -oP 'src \K[^ ]+'` ]
	 then
		  #echo "no change in IP."
		  true
	 else
		  ip route get 8.8.8.8 | grep -oP 'src \K[^ ]+' > $OLD_IP
		  echo "Subject: $(hostname) now $(cat $OLD_IP)" | sendmail adamselker@gmail.com
	  fi
 else
	  ip route get 8.8.8.8 | grep -oP 'src \K[^ ]+' > $OLD_IP
 fi
