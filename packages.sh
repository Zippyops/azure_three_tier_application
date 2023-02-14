#!/bin/bash

 yum update -y
 yum install git -y 
 yum install -y java-1.8.0-openjdk-devel
 yum install epel-release -y
 yum update -y
 yum install nginx -y
 systemctl -l enable nginx
 systemctl -l start nginx
 yum install wget -y
 rm -rf /etc/nginx/nginx.conf
 cd /etc/nginx/
 wget https://raw.githubusercontent.com/hemapriyamaheswaran/nginx.conf/master/nginx.conf
 setsebool -P httpd_can_network_connect 1
 systemctl -l start nginx
 systemctl -l restart nginx
 

