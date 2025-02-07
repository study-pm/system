#!/bin/bash

a=2
b=1

if (( $a == 2 )) && (( $b == 1));
  then
  echo "What you want to do"
fi

a=5
b=30

if [ $a -lt $b ]
then
    echo "a is less than b"
fi

a=50
b=30

if (( $a > $b )); then
    echo "a is greater than b"
fi

re="^[0-9]*[.]{0,1}[0-9]*$"

if [[ $1 =~ $re ]]
then
   echo "is numeric"
else
  echo "Naahh, not numeric"
fi

if [ -z $1 ]
    then echo "The input param $1 is unset or empty"
elif [[ ! $1 =~ $re ]]
    then echo "The input param $1 is not numeric"
elif [ $1 -gt 5 ]
    then echo "The input param $1 is greater than 5"
elif [ $1 -lt 5 ]
    then echo "The input param $1 is less than 5"
elif [ $1 -eq 5 ]
    then echo "The input param $1 is equal to 5"
fi

if [ -z $2 ]
    then echo "The input param $2 is unset or empty"
elif [[ ! $2 =~ $re ]]
    then echo "The input param $2 is not numeric"
elif (( $2 > 5 ))
    then echo "The input param $2 is greater than 5"
elif (( $2 < 5 ))
    then echo "The input param $2 is less than 5"
else
    echo "The input param $2 is equal to 5"
fi
