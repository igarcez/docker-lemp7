#!/bin/bash
if [ $# -eq 0 ]; then
  echo "forneça o id do container"
  exit 1
fi

if [ -f './schema.tar.gz' ];
then
  FILE=./schema.tar.gz
  tar -zxvf $FILE
  FILE_SQL=./schema.sql
  echo "$FILE_SQL extraido, removendo"
  /usr/bin/docker cp $FILE_SQL $1:/var/tmp/$FILE_SQL
  /usr/bin/docker exec $1 sh -c 'exec /usr/bin/mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/tmp/schema.sql'
  /usr/bin/docker exec $1 sh -c 'exec /bin/rm /var/tmp/schema.sql'
  rm $FILE_SQL
else
   echo "schema.tar.gz ausente, não há banco para recuperar"
   exit 1
fi
