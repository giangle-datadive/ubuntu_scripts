sudo apt-get update
#nginx
sudo apt-get install nginx -y
#mysql
sudo apt-get install mariadb-server -y
sudo service mysql start
clear
sudo mysql_secure_installation <<EOF
y
y
y
y
y
y
y
EOF
#php
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get install php7.2 php7.2-fpm php7.2-mysql php7.2-mbstring php7.2-xml -y --allow-unauthenticated
#nodejs
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
#yarn
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install yarn
#composer
sudo apt install composer -y
#zip unzip
sudo apt-get install zip unzip
#git
sudo apt-get install git
#add default config for php
sudo wget https://raw.githubusercontent.com/gianglevan94/ubuntu_scripts/master/virtualhost_nginx -P /etc/nginx/sites-available/
#restart server
sudo service php7.2-fpm restart
sudo service nginx restart
clear
echo "======================================================"
echo "=                                                    ="
echo "=             Install Nginx Succeseed                ="
echo "=        please change mysql root password           ="
echo "=                                                    ="
echo "======================================================"
