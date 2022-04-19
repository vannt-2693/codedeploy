#!/bin/bash
set -e
set -x


echo "AfterInstall"
#Set variable
if [[ "$APPLICATION_NAME" == *"-dev"* ]]; then
    ENV="dev"
else
    exit 1
fi
echo Branch deployment is $BRANCH

PROJECT="codedeploy"
APP_FOLDER="codedeploy"
