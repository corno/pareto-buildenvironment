#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "No path to root of project supplied"
fi

rootDirOfProject="$1"

echo "copying to $rootDirOfProject"
dirOfThisScript=`realpath $(dirname "$0")`
rm -rf $rootDirOfProject/scripts/scripts/*
echo "this script: $dirOfThisScript"
echo "root: $rootDirOfProject"
cp -R $dirOfThisScript/data/projectTemplate/. $rootDirOfProject \
