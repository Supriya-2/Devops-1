#!/bin/bash
  
USERID=$(id -u)







R="\e[31m"
N="\e[0m"

if[$USERID -ne 0]
then 
   echo "$R error $N sever is not in the root access"
   exit 1
fi

