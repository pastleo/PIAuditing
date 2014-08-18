#!/bin/bash

yum install -y tomcat tomcat-webapps tomcat-docs-webapp mysql-connector-java
ln -s /usr/share/java/mysql-connector-java.jar /usr/share/tomcat/lib/
echo "sleep 20" >> /etc/rc.local
echo "service tomcat restart" >> /etc/rc.local
