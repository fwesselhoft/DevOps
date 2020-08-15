#!/bin/bash

#reference: https://www.jenkins.io/doc/book/installing/
sudo apt-get update
echo "Y" | sudo apt install openjdk-8-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt-get install jenkins -y
service jenkins stop
rm -f /var/lib/jenkins/config.xml
rm -rf /var/lib/jenkins/plugins

cd /tmp/
aws s3 cp s3://devops2020jhu/jenkins_config.xml /var/lib/jenkins/config.xml
aws s3 cp s3://devops2020jhu/jenkins_plugins.zip /tmp/
unzip /tmp/jenkins_plugins.zip
mv /tmp/plugins/ /var/lib/jenkins/
rm -rf /tmp/jenkins_plugins.zip /tmp/jenkins_config.xml

service jenkins start
