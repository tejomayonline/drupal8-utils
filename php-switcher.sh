#!/usr/bin/env bash
function switchphp(){
 read -p "php version you want to enable? (i.e. 5.4/5.5/5.6)" new
  read -p "php version you want to disable? (i.e. 5.4/5.5/5.6)" previous
 sudo update-alternatives --list php

  sudo update-alternatives --set php /usr/bin/php$new
  sudo a2dismod php$previous
  sudo a2enmod php$new
  sudo service apache2 restart
}