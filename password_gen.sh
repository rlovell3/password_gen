#!/bin/bash

while getopts l:s: option
do
    case "${option}"
        in
        l)length=${OPTARG};;
        s)style=${OPTARG};;
    esac
done


if [ "$length"  ]
then
  LENGTH1=$length
else
  LENGTH1="20"
fi

if [ "$style" == "A" ]
then 
    #  Use this one if you really want a ton of characters in the password.  
    #  REMOVED: " \ ' 
    LC_ALL=C tr -dc 'A-Za-z0-9!#$~%&()*+,-./:;<=>?@[]^_{|}~' </dev/random | head -c $LENGTH1 ; echo
elif [ "$style" == "N" ]
then
    LC_ALL=C tr -dc 'A-Za-z0-9' </dev/random | head -c $LENGTH1 ; echo
elif [ "$style" == "H" ]
then
    LC_ALL=C tr -dc 'A-Za-z0-9' </dev/random | head -c $LENGTH1 | fold -w4 | paste -sd- ; echo
elif [ "$style" == "S" ]
then
    LC_ALL=C tr -dc 'A-Za-z' </dev/random | head -c $LENGTH1 | fold -w4 | paste -sd- ; echo
elif [ "$style" == "U" ]
then
    LC_ALL=C tr -dc 'A-Z' </dev/random | head -c $LENGTH1 | fold -w4 | paste -sd- ; echo    
else
    # Use this one for upper and lowercase letters, numbers, and a small subset of symbols
    LC_ALL=C tr -dc 'A-Za-z0-9!@+*=#$%&' </dev/random | head -c $LENGTH1 ; echo
fi

# note on dev/random and dev/urandom from the luks manpage:
#     Using /dev/random on a  system  without  enough entropy 
#     sources can cause luksFormat to block until the requested 
#     amount of random data is gathered. In a low-entropy situation 
#     (embedded system), this can take a very long time  and  potentially
#     forever. At the same time, using /dev/urandom in a low-entropy situation
#     will produce low-quality keys. This is a serious problem, but solving it 
#     is out of scope  for a mere man-page.  See urandom(4) for more information.

# 2022-08-08:  as this comes from the luks manpage, I'm switching to /dev/random
# in the code above (and no longer using /dev/urandom).

# 2022-08-08: adding cases "S" and "U" to the style choices.






# interesting snippets from around the net:
#  openssl rand -base64 16
# for i in {1..8} ; do head -$(expr $(head -c7 /dev/urandom | od -An -t dL) % $(wc -l < /usr/share/dict/british-english)) /usr/share/dict/british-english | tail -1 ; done
# od -An -x /dev/urandom | head -1
#
