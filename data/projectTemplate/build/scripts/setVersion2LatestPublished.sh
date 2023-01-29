#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

pushd "$rootDir/pub" > /dev/null && \

name=$(npm pkg get name | cut -c2- | rev | cut -c2- |rev) && \

remoteVersion=$(npm view $name@latest version) && \

echo ">>>>>>>>>$name>>>>>>>$remoteVersion" && \

npm pkg set version="$remoteVersion" && \

popd > /dev/null
