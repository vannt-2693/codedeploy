#!/bin/bash
set -e
set -x


echo "BeforeInstall"
#Set variable

BRANCH="master"

echo Branch deployment is $BRANCH

APP_FOLDER="demo-asg-bg"

#Pull/Clone code from repo | If exist -> Fetch(in-place EC2); else Clone(new EC2)
cd /home/ubuntu
if [ -d "$APP_FOLDER" ]; then
    cd $APP_FOLDER
    git reset --hard
    git checkout $BRANCH
    git pull origin $(git rev-parse --abbrev-ref HEAD)
else
    git clone -b $BRANCH --single-branch https://github.com/vannt-2693/codedeploy.git $APP_FOLDER
    cd $APP_FOLDER
    git reset --hard
fi
