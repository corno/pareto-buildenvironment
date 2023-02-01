#!/usr/bin/env bash

cd "../pub"


root="`cd "$rootDir";pwd`" # the resolved path to the root dir of the project
name=`basename $root`

localFingerprint=$(npm pkg get content-fingerprint | cut -c2- | rev | cut -c2- |rev)
remoteFingerprint=$(npm view $name@latest content-fingerprint)

if [ $localFingerprint != $remoteFingerprint ]
then
    echo "NOT EQUAL!!!!!!!!!!!!!!!!!!!!!!"
fi

echo $localFingerprint $remoteFingerprint       