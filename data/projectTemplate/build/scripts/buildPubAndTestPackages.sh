#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

#pub
$scriptDir/buildPackage.sh "$rootDir/pub" && \

#test
$scriptDir/buildPackage.sh "$rootDir/test"
