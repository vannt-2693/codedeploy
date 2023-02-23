#!/bin/bash
set -e
set -x

echo "AfterInstall"
#Set variable
APP_FOLDER="codedeploy"

echo Branch deployment is $BRANCH

#Copy .env file from S3 secrets to web folder
cd /home/ubuntu/$APP_FOLDER

#sudo rm /var/www/html/index.html
sudo cp index.html /var/www/html/
# install all dependencies for project
