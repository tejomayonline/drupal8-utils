## How to use

Currently It is for using in LAMP stacks.In future it will support other stacks like
 LEMP too

It is to a shell script bash
"Enter your 1.project_name/2.db_name/3.place_of_install/4.account_mail/5.account_name/6.account_pass/7.site_mail/8.site_name : 
can be used as shell script or bash aliases function
  the function takes 3 arguments as parameter to execute
	 1. 1st argument is for drupal project name   
	 2.  2nd is for database of your drupal project will use   
	 3.  your web root like /var/www/html(apache) or /var/www(nginx)	 
	 4.  site admin a/c email 
	 5.  site admin a/c name i.e. admin
	 6.  site admin a/c password i.e. *****
	 7.  site email id i.e. admin@admin.com
	 8.  site name i.e drupal8
	 
	 It can used as bash aliases in your .bash_aliases.0
	 just add the inner code of this .bash_aliases to your bash aliases
	 then source it and use it by

	 d8init project_name db_name place_of_install account_mail account_name account_pass site_mail site_name
	 
to use it
```
cd drupal8-utils
   ./drupal8-install.sh project_name db_name place_of_install account_mail account_name account_pass site_mail site_name
```

you are done..


----------


The drupal8-install.sh script uses the [drupal-composer/drupal-project](https://github.com/drupal-composer/drupal-project) repository template
for composer based drupal 8 installation.for further use please refer to this link. 