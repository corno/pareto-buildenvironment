#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

root="`cd "$rootDir";pwd`" # the resolved path to the root dir of the project
name=`basename $root`

pushd "$rootDir/typescript/pub" > /dev/null && \

localFingerprint=$(npm pkg get content-fingerprint | cut -c2- | rev | cut -c2- |rev) && \
remoteFingerprint=$(npm view $name@latest content-fingerprint) && \

popd > /dev/null

if [ $localFingerprint != $remoteFingerprint ]
then
    echo "NOT EQUAL!!!!!!!!!!!!!!!!!!!!!!"
fi

echo $localFingerprint $remoteFingerprint       