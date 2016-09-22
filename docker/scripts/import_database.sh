#!/bin/bash
if [ $# -eq 0 ]; then
  echo "Please provide container ID (use docker ps to find out the id of the mysql:latest container)"
  exit 1
fi

if [ -f './schema.tar.gz' ];
then
  FILE=./schema.tar.gz
  tar -zxvf $FILE
  FILE_SQL=./schema.sql
  echo "$FILE_SQL extracted, sending to container"
  /usr/bin/docker cp $FILE_SQL $1:/var/tmp/$FILE_SQL
  /usr/bin/docker exec $1 sh -c 'exec /usr/bin/mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/tmp/schema.sql'
  /usr/bin/docker exec $1 sh -c 'exec /bin/rm /var/tmp/schema.sql'
  echo "Sent to container, removing local file"
  rm $FILE_SQL
else
   echo "./schema.tar.gz not found"
   exit 1
fi
