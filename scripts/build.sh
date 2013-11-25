#!/bin/bash
set -e

# This script is meant to be run automatically
# as part of the ssg-hook application.
# https://github.com/developmentseed/ssg-hook

repo=$1
branch=$2
owner=$3
giturl=$4
source=$5
build=$6

# Check to see if repo exists. If not, git clone it
if [ ! -d $source ]; then
    git clone $giturl $source
fi

# Git checkout appropriate branch, pull latest code
cd $source
git checkout $branch
git pull origin $branch
cd -

# Run ssg
cd $source
ssg $source $build --no-server --no-auto
cd -