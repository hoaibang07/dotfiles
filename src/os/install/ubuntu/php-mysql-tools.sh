#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Apache2 - PHP, MySQL\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#apache2
if ! package_is_installed "apache2"; then
	sudo apt-get -y install apache2
else
    print_success "apache2"
fi

if ! package_is_installed "php"; then
    add_ppa "ondrej/php"
    execute \
    		"sudo apt-get -y install php7.1 php7.1-common php7.1-opcache php7.1-mcrypt php7.1-cli php7.1-gd php7.1-curl php7.1-mysql php7.1-mbstring" \
    		"Install PHP 7.1 and extensions"
    sudo sh -c "printf '<?php phpinfo(); ?>' >> '/var/www/html/phpinfo.php'"
else
    print_success "PHP"
fi

#restart apache
execute \
		"systemctl restart apache2" \
		"restart apache2"

#mysql
if ! package_is_installed "mysql"; then
    execute \
    		"sudo apt-get -y install mysql-server mysql-client" \
    		"Install MySQL"
else
    print_success "MySQL"
fi

#Secure your MySQL server
#sudo mysql_secure_installation
#N,Y,Y,Y,Y

#Mysql gui tool
if ! package_is_installed "dbeaver-ce"; then

    add_key "https://dbeaver.io/debs/dbeaver.gpg.key" \
        || print_error "dbeaver (add key)"

    add_to_source_list "https://dbeaver.io/debs/dbeaver-ce /" "dbeaver.list" \
        || print_error "dbeaver (add to package resource list)"

    update &> /dev/null \
        || print_error "dbeaver (resync package index files)"

fi
