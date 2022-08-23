#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

pushd "$rootDir/pub" > /dev/null && \

localFingerprint=$(npm pkg get content-fingerprint | cut -c2- | rev | cut -c2- |rev) && \
packageName=$(npm pkg get name | cut -c2- | rev | cut -c2- |rev) 

popd && \

remoteFingerprint=$(npm view $packageName@latest content-fingerprint) && \
if [ $localFingerprint == $remoteFingerprint ]
then
    echo "no changes detected, nothing is published"
else
    $scriptDir/publishWithoutChecksAndBalances.sh $1
fi