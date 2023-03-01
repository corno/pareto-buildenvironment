#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "No generation supplied"
fi

generation=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

pushd "$rootDir/typescript/pub" > /dev/null && \

localFingerprint=$(npm pkg get content-fingerprint | cut -c2- | rev | cut -c2- |rev) && \

root="`cd "$rootDir";pwd`" # the resolved path to the root dir of the project
name=`basename $root`

popd && \

#working dir doesn't matter for 'view'
remoteFingerprint=$(npm view $name@latest content-fingerprint) && \
if [ $localFingerprint == $remoteFingerprint ]
then
    echo "no changes detected, nothing is published"
else
    $scriptDir/publishWithoutChecks.sh $generation
fi