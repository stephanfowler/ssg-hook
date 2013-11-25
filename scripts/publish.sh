#!/bin/bash
set -e

# This script is meant to be run automatically
# as part of the ssg-hook application.

# Requires a forked version of `s3cmd` that correctly
# handleds --exclude files with the --delete-removed flag.
# Clone the fork https://github.com/developmentseed/s3cmd
# and install it with `python setup.py install`.

# S3 bucket
bucket="aws-frontend-store/STEPHAN"

repo=$1
branch=$2
owner=$3
giturl=$4
source=$5
build=$6

s3cmd sync --acl-public --delete-removed $build/ s3://$bucket/$repo/

