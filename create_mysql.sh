#!/bin/bash

docker rm -f frd-mysql-db
docker volume prune
docker volume create frd-mysql-db-data
docker volume ls
docker run -d -p 33060:3306 --name frd-mysql-db  -e MYSQL_ROOT_PASSWORD=sysfraud --mount src=frd-mysql-db-data,dst=/var/lib/mysql mysql
echo 'Waiting 1m for creation'

$i = 0;
while :
do
  if $i == 60
  then
    echo "Continue"
    break
  fi
  $i = $i + 1;
  echo -ne "$i sec."\\r
  sleep 1s
done

docker exec -i frd-mysql-db mysql -u root --password=sysfraud
exit