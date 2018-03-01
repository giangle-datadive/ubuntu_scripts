sudo apt-get update
#nginx
sudo apt-get install nginx -y
#mysql
sudo apt-get install mariadb-server -y
sudo service mysql start
clear
echo "================================================================="
echo -e "Enter mysql password: \c"
read -s password
echo
echo -e "Enter confirmation mysql password: \c"
read -s password2
echo
if [ $password -eq $password2 ]
then
sudo mysql_secure_installation <<EOF
y
$password
$password
y
y
y
y
EOF
#php
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get install php7.2 php7.2-fpm php7.2-mysql php7.2-mbstring php7.2-xml php7.2-mcrypt -y
#nodejs
sudo curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
#yarn
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install yarn
#composer
sudo apt-get install composer -y
#zip unzip
sudo apt-get install zip unzip
#git
sudo apt-get install git
#mkdir projects
sudo mkdir ~/projects
sudo chown -R ubuntu ~/projects
sudo chown -R www-data ~/project
#add default config for php
sudo wget https://raw.githubusercontent.com/gianglevan94/ubuntu_scripts/master/virtualhost_nginx -P /etc/nginx/sites-available/
#restart server
sudo service php7.2-fpm restart
sudo service nginx restart
clear
echo "=============================="
echo "=                            ="
echo "=                            ="
echo "=   Install Nginx Succeseed  ="
echo "=                            ="
echo "=                            ="
echo "=============================="
else
echo "Password confirmation not match"
fi