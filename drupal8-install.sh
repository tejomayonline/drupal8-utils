#!/usr/bin/env bash

#this script  helps you to create a one command fresh drupal 8 site install
#it is a simple shell script bash has 3 arguments
#1st argument drupal project name,2nd is drupal database name,3rd is drupal site name
#using mysql username as root,pwd as 12345  in line 16
#setting drupal site admin username as admin and password as 12345 in line 18-19

echo "What is your web server(apache/nginx)?"
read server
server =$server
get_web_server "$server"
project_name=$(create_drupal_project)
db_name=$(upsert_db)
get_web_server "$server"
site_install "$project_name" "$db_name"


function get_web_server{
if (( $1 == "nginx" )) ; then
  cd /var/www/$2
elif (( $1 == "apache" )) || (( $1 == "apache2" )) ; then
    cd /var/www/html/$2
else
  echo "sorry server is not listed in me!"
  exit 1
fi
}

function  create_drupal_project{
echo "please provide drupal project name"
read project
project_name =$project
composer create-project drupal-composer/drupal-project:8.x-dev $project --stability dev --no-interaction

}
function upsert_db{
echo "enter database name"
read db
db_name =$db
output=$(mysql -s -N -e "SELECT schema_name FROM information_schema.schemata WHERE schema_name = '${db}'" information_schema)
if ((  "$output" == 0 )) ; then
  "your database exists"
elif (( "$output" == 1 ))  ; then
    mysqladmin -u root -p12345 create $db
else
  echo "sorry un-expected result!"
  exit 1
fi

}
function site_install{
  cd /var/www/html/$1/web
  echo "please enter admin 1=username,2=password,3=sitename,4=accoutn mail,5 "
../vendor/drush/drush/drush site-install standard \
  --db-url=mysql://root:12345@localhost/$2 \
  --account-mail="tejomay.saha10@gmail.com" \
  --account-name=admin \
  --account-pass=12345 \
  --site-mail="tejomay.saha10@gmail.com" \
  --site-name="$3"
}