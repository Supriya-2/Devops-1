#!/bin/bash
  
USERID=$(id -u)
LOGPATH=/home/centos/shell.lods
DATE=$(date +%F)
LOGFILE=$LOGPATH-$0/$DATE.log







R="\e[31m"
N="\e[0m"
S="\e[31m"
Y="\e[33m"


if [ $USERID -ne 0 ];
then 
   echo -e "$R error $N sever is not in the root access"
   exit 1
fi

VALI(){
    if [ $1 -ne 0 ];
    then
    echo -e "installing $2 ......$R fail $N"
    else 
      echo -e "installing  $2 ......$S succes $N"
}

for i in $@
do 
  yum list installed $i
   if [ $? -ne 0 ];
then
    echo " $i is not they let's install now"
    yum install $i -y
    VALI $? $i
  else
    echo -e " $Y $i it is already there $N"
fi
done
