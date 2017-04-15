#!/usr/bin/env bash

#this script  helps you to create a one command fresh drupal 8 site install
#it is a simple shell script bash has 3 arguments
#1st argument drupal project name,2nd is drupal database name,3rd is drupal site name
#using mysql username as root,pwd as 12345  in line 16
#setting drupal site admin username as admin and password as 12345 in line 18-19

function d8init(){
  cd /var/www/html
composer create-project drupal-composer/drupal-project:8.x-dev $1 --stability dev --no-interaction
  echo "$1=project name /$2=dbname/$3=site-name"
  mysqladmin -u root -p12345 create $2
  cd /var/www/html/$1/web
../vendor/drush/drush/drush site-install standard \
  --db-url=mysql://root:12345@localhost/$2 \
  --account-mail="tejomay.saha10@gmail.com" \
  --account-name=admin \
  --account-pass=12345 \
  --site-mail="tejomay.saha10@gmail.com" \
  --site-name="$3"
}