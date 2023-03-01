#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

if [ -z "$1" ]
  then
    echo "No path to root of project supplied"
    exit 1
fi

rootDirOfProject=`realpath "$1"`

echo "copying to $rootDirOfProject"
rm -rf $rootDirOfProject/scripts/scripts/*
cp -RT $scriptDir/data/projectTemplate $rootDirOfProject
