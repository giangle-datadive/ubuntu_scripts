sudo apt-get update
#apache2
sudo apt-get install apache2 -y
 
#mysql
sudo apt-get install mariadb-server -y
sudo service mysql start
echo "======================================================================="
echo -e "Enter mysql password: \c"
read -s password
echo
echo -e "confirmation mysql password: \c"
read -s password2
echo
if [ $password -eq $password2 ]
then
mysql_secure_installation <<EOF
y
$password
$password
y
y
y
y
EOF
##php
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get install php7.2 libapache2-mod-php php7.2-mcrypt php7.2-fpm php7.2-mysql php7.2-mbstring php7.2-xml -y
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
sudo truncate -s 0 /etc/apache2/mods-enabled/dir.conf
sudo echo "<IfModule mod_dir.c>
   DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm
</IfModule>" >> /etc/apache2/mods-enabled/dir.conf
sudo service apache2 restart
clear
echo "=============================="
echo "=                            ="
echo "=                            ="
echo "=  Install Apache Succeseed  ="
echo "=                            ="
echo "=                            ="
echo "=============================="
else
  echo "Password confirmation not match"
fi