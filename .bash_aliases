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