#!/usr/bin/env bash
paretoBuildEnvDir=$1
rootDirOfProject="$1/.."

echo "copying to $rootDirOfProject"
dirOfThisScript=`realpath $(dirname "$0")`
rm -rf $rootDirOfProject/build/scripts/*
cp -R $dirOfThisScript/data/projectTemplate/. $rootDirOfProject \
