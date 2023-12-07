#!/bin/bash

sudo su - 
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
aws s3 cp s3://sbs-world-cup/sbs-world-cup.jpeg /var/www/html/
echo "<h1>The hostname of the EC2 instance is :  $(hostname -f)</h1>" > /var/www/html/index.html
echo "<img src='sbs-world-cup.jpeg' alt='SBS World Cup Image'>" >> /var/www/html/index.html