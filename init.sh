#!/usr/bin/env bash

# clear current html directory
rm -Rf /var/www/html/*

# set default repo if not set
if [ -z "$GIT_REPO" ]; then
  GIT_REPO="https://github.com/napalm255/phpinfo.git"
fi

# clone repo into html directory
git clone $GIT_REPO /var/www/html
