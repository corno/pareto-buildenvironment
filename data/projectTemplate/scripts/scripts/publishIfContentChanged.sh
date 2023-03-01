#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

if [ -z "$1" ]
  then
    echo "No generation supplied"
fi

generation=$1

rootDir=`realpath "$scriptDir/../.."`
pubDir=$rootDir/typescript/pub

localFingerprint=$(npm pkg get content-fingerprint --prefix $pubDir | cut -c2- | rev | cut -c2- |rev) && \

name=`basename $rootDir`

#working dir doesn't matter for 'view'
remoteFingerprint=$(npm view $name@latest content-fingerprint --prefix $pubDir) && \
if [ $localFingerprint == $remoteFingerprint ]
then
    echo "no changes detected, nothing is published"
else
    $scriptDir/publishWithoutChecks.sh $generation
fi