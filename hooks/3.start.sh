#!/bin/bash
set -e
set -x


echo "ApplicationStart"
#Set variable
echo Branch deployment is $BRANCH

PROJECT="codedeploy"

sudo systemctl reload nginx.service
