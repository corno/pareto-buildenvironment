#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`
pubDir="$rootDir/typescript/pub"

#pub
$scriptDir/buildPackage.sh "$pubDir" && \

if [ -d "$pubDir/dist/bin" ]
then
    find "$pubDir/dist/bin" -name "*.js" -exec chmod 777 {} +
fi && \

#test
$scriptDir/buildPackage.sh "$rootDir/typescript/test"
