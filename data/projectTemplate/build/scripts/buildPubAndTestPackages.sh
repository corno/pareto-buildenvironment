#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

#pub
$scriptDir/buildPackage.sh "$rootDir/pub" && \

if [ -d "$rootDir/pub/dist/bin" ]
then
    pushd "$rootDir" > /dev/null && \
    find "./pub/dist/bin" -name "*.js" -exec chmod 777 {} + && \
    popd > /dev/null
fi && \

#test
$scriptDir/buildPackage.sh "$rootDir/test"
