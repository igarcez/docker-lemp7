# docker-lemp7
Development Environment using LEMP and php 7 and persistent database

# Requirements
- [docker](https://www.docker.com/)
- [docker-compose](https://www.docker.com/)

# How to use
**First time**: Put all the files on the root of the project and execute
`docker-compose up -d --build`

**Second time onwards**: execute `docker-compose start` to start the containers, and `docker-compose stop` to stop them.

Access your development website at http://localhost/

Access phpmyadmin at http://localhost:8080

# Import a mysql database
You can use the helper bash script located in `docker/scripts/` to send a sql dump to the server, let's see how:

- Name your dump as schema.sql and compress it with `tar -zcvf schema.tar.gz schema.tar`
- Put the schema.tar.gz in the same folder as the helper script
- Use `docker ps` to find out your mysql:latest container ID
- Execute the script providing the ID `./import_database.sh 0934b6a8b562`

# Images used
- [php](https://hub.docker.com/_/php/)
- [nginx](https://hub.docker.com/_/nginx/)
- [mysql](https://hub.docker.com/_/mysql/)

**thanks to [osteel](https://disqus.com/by/osteel/) for making a [great tutorial](http://tech.osteel.me/posts/2015/12/18/from-vagrant-to-docker-how-to-use-docker-for-local-web-development.html) on docker**
