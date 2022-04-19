#!/bin/bash
set -e
set -x


echo "BeforeInstall"
#Set variable
if [[ "$APPLICATION_NAME" == *"-dev"* ]]; then
    BRANCH="master"
    RELEASE_TAG="master" 
else
    exit 1
fi
echo Branch deployment is $BRANCH

APP_FOLDER="codedeploy"

#Pull/Clone code from repo | If exist -> Fetch(in-place EC2); else Clone(new EC2)
cd /home/deploy
if [ -d "$APP_FOLDER" ]; then
    cd $APP_FOLDER
    git reset --hard
    git checkout $BRANCH
    git pull origin $(git rev-parse --abbrev-ref HEAD)
else
    git clone -b $BRANCH --single-branch git@github.com:PRTIMES/$PROJECT.git $APP_FOLDER
    cd $APP_FOLDER
    git reset --hard
fi
