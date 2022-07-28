#!/bin/bash

while getopts l:s: option
do
    case "${option}"
        in
        l)length=${OPTARG};;
        s)style=${OPTARG};;
    esac
done


if [ "$length" > 0 ]
then
  LENGTH1=$length
else
  LENGTH1="20"
fi

if [ "$style" == "A" ]
then 
    #  Use this one if you really want a ton of characters in the password.  
    #  REMOVED: " \ ' 
    LC_ALL=C tr -dc 'A-Za-z0-9!#$~%&()*+,-./:;<=>?@[]^_{|}~' </dev/urandom | head -c $LENGTH1 ; echo
elif [ "$style" == "N" ]
then
    LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c $LENGTH1 ; echo
elif [ "$style" == "H" ]
then
    LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c $LENGTH1 | fold -w4 | paste -sd- ; echo

else
    # Use this one for upper and lowercase letters, numbers, and a small subset of symbols
    LC_ALL=C tr -dc 'A-Za-z0-9!@+*=#$%&' </dev/urandom | head -c $LENGTH1 ; echo
fi


# interesting snippets from around the net:
#  openssl rand -base64 16
# for i in {1..8} ; do head -$(expr $(head -c7 /dev/urandom | od -An -t dL) % $(wc -l < /usr/share/dict/british-english)) /usr/share/dict/british-english | tail -1 ; done
# od -An -x /dev/urandom | head -1

