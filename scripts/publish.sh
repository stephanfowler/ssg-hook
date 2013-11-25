#!/bin/bash
set -e

# This script is meant to be run automatically
# as part of the ssg-hook application.

# Requires a forked version of `s3cmd` that correctly
# handleds --exclude files with the --delete-removed flag.
# Clone the fork https://github.com/developmentseed/s3cmd
# and install it with `python setup.py install`.

# Set the path of the hosted site
site="/usr/share/nginx/www/$repo"

# S3 bucket
bucket="aws-frontend-store/STEPHAN"

repo=$1
branch=$2
owner=$3
giturl=$4
source=$5
build=$6

# Remove old site files, move new ones in place
rm -rf $site
cp $build $site

# if not root repo, sync to subdirectory
s3cmd sync --acl-public --delete-removed $build/ s3://$bucket/$repo/

