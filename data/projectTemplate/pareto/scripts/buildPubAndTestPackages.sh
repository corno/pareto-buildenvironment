#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

#pub
$scriptDir/buildPackage.sh "$(pwd)/../pub" && \
$scriptDir/setContentFingerprint.sh "$(pwd)/../pub" && \

#test
$scriptDir/buildPackage.sh "$(pwd)/../test" && \


if [ -d "$(pwd)/../pub/src/bin" ]
then
    find ../pub/dist/bin/* -name "*.js" -exec chmod 777 {} +
fi
