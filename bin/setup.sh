#!/bin/bash

docker-compose up -d
#docker exec wplocaldocker_php-apache_1 curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#docker exec wplocaldocker_php-apache_1 chmod +x wp-cli.phar
#docker exec wplocaldocker_php-apache_1 mv wp-cli.phar /usr/local/bin/wp
#docker exec -u www-data wplocaldocker_php-apache_1 wp core download
docker exec -u www-data wplocaldocker_php-apache_1 wp config create \
    --dbname=wordpress \
    --dbuser=wordpress\
    --dbpass=password
docker exec -u www-data wplocaldocker_php-apache_1 wp core install \
    --url=http://localhost \
    --title="Auth0 ♥ Docker" \
    --admin_user=josh.cunningham@auth0.com \
    --admin_email=josh.cunningham@auth0.com
docker exec -u www-data wplocaldocker_php-apache_1 wp plugin install auth0
docker exec -u www-data wplocaldocker_php-apache_1 wp plugin activate auth0
docker-compose stop
