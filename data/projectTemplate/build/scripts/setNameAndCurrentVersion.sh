#!/usr/bin/env bash
generation=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

root="`cd "$rootDir";pwd`" # the resolved path to the root dir of the project
name=`basename $root`

remoteVersion=$(npm view $name@latest version) && \

pushd "$rootDir/pub" > /dev/null && \

npm pkg set name="$name" && \
npm pkg set repository.url="http://github.com/corno/$name" && \
npm pkg set version="$remoteVersion"