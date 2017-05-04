#!/usr/bin/env bash
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