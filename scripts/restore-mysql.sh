#!/bin/sh
set -e -x

mntFolder=$1
dumpfile=$2

docker run -v $mntFolder:/mnt bahmnidocker_mysql_1
docker exec -it $container bash

mysql -uroot -ppassword -hdockerhost  -e "show databases" | grep -v Database | grep -v mysql| grep -v information_schema| grep -v test | grep -v OLD |gawk '{print "drop database " $1 ";select sleep(0.1);"}' | mysql -uroot -ppassword
mysql -uroot -ppassword -hdockerhost < /mnt/$dumpfile