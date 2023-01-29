#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

name=$(npm pkg get name | cut -c2- | rev | cut -c2- |rev) && \

remoteVersion=$(npm view $name@latest version) && \

pushd "$rootDir/pub" > /dev/null && \

npm pkg set version="$remoteVersion" && \

popd > /dev/null
