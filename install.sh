#!/bin/bash
  
USERID=$(id -u)
LOGPATH=/home/centos/shell.lods
DATE=$(date +%F)
LOGFILE=$LOGPATH-$0/$DATE.log







R="\e[31m"
N="\e[0m"

if [ $USERID -ne 0 ];
then 
   echo -e "$R error $N sever is not in the root access"
   exit 1
fi

for i in $@
do 
  yum list installed $i
   if [$? -ne 0];
then
    echo " $i is not they let's install now"
    yum install $i -y
  else
    echo "$i it is already there"

