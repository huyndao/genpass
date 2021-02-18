#!/bin/sh

genpass()
{
    # takes 4096 alpha-numeric and the @, $, # chars from /dev/urandom, 
    # then select the number of chars requested for password

    < /dev/urandom tr -dc [:alnum:]\@\$\# 2> /dev/null | head -c 4096 | tail -c ${1} ; echo ;
}

if [ $# -ne 2 ] || [ $1 = "-h" -o $1 = "--help" ]
then
    echo "$0 (number of chars) (number of passes)"
    exit 1
else
    line=0
    while [ ${line} -lt ${2} ]
    do
        genpass ${1}
        line=$(( ${line}+1 ))
    done
    exit 0
fi
