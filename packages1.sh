#!/bin/bash
sudo apt-get update -y
sudo ufw enable
sudo ufw allow 22
sudo ufw allow 3306
sudo ufw allow 8080
apt-get -y install zsh htop
echo "mysql-server-5.7 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password root" | sudo debconf-set-selections
apt-get -y install mysql-server-5.7
mysql_secure_installation
sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf
mysql -uroot -p -e 'USE mysql; UPDATE `user` SET `Host`="%" WHERE `User`="root" AND `Host`="localhost"; DELETE FROM `user` WHERE `Host` != "%" AND `User`="root"; FLUSH PRIVILEGES;'
service mysql restart
cd /home/
git clone https://github.com/hemapriyamaheswaran/tomcat.git
cd /home/tomcat/
sudo apt-get install openjdk-8-jdk
sudo apt-get install git -y
sudo apt-get install maven -y
sudo apt-get install tomcat8 -y
sudo apt-get install tomcat8-docs tomcat8-examples tomcat8-admin -y
sudo systemctl start tomcat8
sudo systemctl enable tomcat8
cd /home/
git clone https://github.com/hemapriyamaheswaran/myjdbc.git
cd /home/myjdbc
mvn clean install
rm -rf /etc/tomcat/tomcat-users.xml
cp /home/tomcat/tomcat-users.xml /etc/tomcat8/tomcat-users.xml
cp /home/myjdbc/target/*.war /var/lib/tomcat8/webapps/
sleep 120s
sudo mysql -h hemapriyadb.mysql.database.azure.com -u hemapriya@hemapriyadb -pZIPPYOPSzipp11 -D hemadb -e "create table registration (name varchar(30),email varchar(30) primary key,gender varchar(7),password varchar(30))";
systemctl restart mysql
systemctl restart tomcat8
chmod 755 /home/tomcat/set.sh
/home/tomcat/set.sh

