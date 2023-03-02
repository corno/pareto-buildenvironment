#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir=`realpath "$scriptDir/../.."`
pubDir=`realpath "$rootDir/typescript/pub"`

name=`basename $rootDir`

localFingerprint=$(npm pkg get content-fingerprint --prefix $pubDir | cut -c2- | rev | cut -c2- |rev) && \
remoteFingerprint=$(npm view $name@latest content-fingerprint --prefix $pubDir) && \

if [ $localFingerprint != $remoteFingerprint ]
then
    echo "NOT EQUAL!!!!!!!!!!!!!!!!!!!!!!"
fi

echo $localFingerprint $remoteFingerprint       