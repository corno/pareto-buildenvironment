#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

if [ -d "$rootDir/dev" ]
then
    $scriptDir/buildDevPackage.sh && \
    rm -rf $rootDir/pub/src/generated && \
    rm -rf $rootDir/test/src/generated && \
    node $rootDir/dev/dist/bin/generateCode.js ..
fi \


$scriptDir/buildPubAndTestPackages.sh && \
if [[ $rootName == api-* ]]
then
    echo "$rootName; no testing for api"
else
    node $rootDir/test/dist/bin/test.js $rootDir/test/data
fi \

