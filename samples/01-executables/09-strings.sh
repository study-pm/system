#!/bin/bash

user="viktor"

if [ $user = $USER ]
then echo "The user $user is the current logged in user"
fi

read -p "Enter user name: " uname

if [ $uname = $USER ]
    then echo "The user $uname is the current logged in user"
else
    echo "The user $uname is not the current user"
fi
