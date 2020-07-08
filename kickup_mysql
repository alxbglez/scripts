#!/bin/bash

docker rm -f frd-mysql-db
docker run -d -p 33060:3306 --name frd-mysql-db  -e MYSQL_ROOT_PASSWORD=sysfraud --mount src=frd-mysql-db-data,dst=/var/lib/mysql mysql
echo 'Waiting for creation'

x=30
while [ $x -gt 0 ]
do
  echo "$x"
  sleep 1s
  x=$(( $x - 1 ))
done
echo 'Done'