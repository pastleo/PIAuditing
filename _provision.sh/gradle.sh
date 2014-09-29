#!/bin/bash

mkdir -p /usr/local/
wget https://services.gradle.org/distributions/gradle-2.1-bin.zip -O /usr/local/gradle.zip
unzip /usr/local/gradle.zip -d /usr/local/
rm -fv /usr/local/gradle.zip
mv /usr/local/gradle* /usr/local/gradle
ln -s /usr/local/gradle/bin/gradle /usr/bin/
