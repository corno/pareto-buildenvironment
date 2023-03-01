#!/usr/bin/env bash
paretoBuildEnvDir=$1
rootDirOfProject="$1/.."

echo "run this script from the ./scripts directory"
echo "copying to $rootDirOfProject"
dirOfThisScript=`realpath $(dirname "$0")`
rm -rf $rootDirOfProject/scripts/scripts/*
cp -R $dirOfThisScript/data/projectTemplate/ $rootDirOfProject \
