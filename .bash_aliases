function d8init(){
  cd /var/www/html
read -p "Enter your 1.project_name/2.db_name/3.place_of_install/4.account_mail/5.account_name/6.account_pass/7.site_mail/8.site_name : " project_name  db_name place_of_install account_mail account_name account_pass site_mail site_name
composer create-project drupal-composer/drupal-project:8.x-dev $project_name --stability dev --no-interaction
  mysqladmin -u root -p12345 create $dbname
  cd $place_of_install/$project_name/web
../vendor/drush/drush/drush site-install standard \
  --db-url=mysql://root:12345@localhost/$db_name\
  --account-mail=$account_mail \
  --account-name=$account_name \
  --account-pass=$account_pass \
  --site-mail=$site_mail \
  --site-name=$site_name
}

function installphp(){
  sudo apt-get install software-properties-common
  sudo add-apt-repository ppa:ondrej/php
  sudo apt-get update
  read -p "the php version you need(i.e. 5.6/7.0/7.1) : " version

  sudo apt-get install php$version
  sudo apt-get install php$version-mbstring php$version-mysql php$version-gd php$version-dom  php$version-xdebug php$version-mongo
  php$version-curl php$version-xml php$version-xsl php$version-readline php$version-opcache php$version-intl php$version-mbstring php$version-mcrypt
  sudo service apache2 restart
}