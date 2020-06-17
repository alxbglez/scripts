#!/bin/bash

docker rm -f frd-mysql-db
docker volume prune
docker volume create frd-mysql-db-data
docker volume ls
docker run -d -p 33060:3306 --name frd-mysql-db  -e MYSQL_ROOT_PASSWORD=sysfraud --mount src=frd-mysql-db-data,dst=/var/lib/mysql mysql
docker exec -it frd-mysql-db mysql -p
exit