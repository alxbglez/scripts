#!/bin/bash

docker rm -f frd-mysql-db
docker volume prune
docker volume create frd-mysql-db-data
docker volume ls
docker run -d -p 33060:3306 --name frd-mysql-db  -e MYSQL_ROOT_PASSWORD=sysfraud --mount src=frd-mysql-db-data,dst=/var/lib/mysql mysql
echo 'Waiting 1m for creation'

x=1
while [ $x -le 60 ]
do
  echo -ne "$x sec."\\r
  sleep 1s
  x=$(( $x + 1 ))
done

docker exec -i frd-mysql-db mysql -u root --password=sysfraud
exit