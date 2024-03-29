#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`

#make sure everything is pushed
git "push" && \

#validate that everything is committed and pushed (to make sure we're not messing with open work)
"$scriptDir/assertNoOpenGitChanges.sh" && \

echo "...building from scratch" && \
"$scriptDir/buildFromScratch.sh" && \

#validate that everything is still committed after the update and build
"$scriptDir/assertNoOpenGitChanges.sh" && \

echo "...setting dynamic package data" && \
"$scriptDir/setDynamicPackageData.sh" && \

echo "...determining scope of change" && \

rawLocalInterfaceFingerPrint=`npm pkg get interface-fingerprint --prefix $rootDir/typescript/pub` && \

if [ $rawLocalInterfaceFingerPrint == "{}" ]
then
    #no interface fingerprint

    "$scriptDir/publishIfContentChanged.sh" "minor"

else

    localInterfaceFingerPrint=$($rawLocalInterfaceFingerPrint | cut -c2- | rev | cut -c2- |rev) && \
    remoteInterfaceFingerprint=$(npm view $name@latest interface-fingerprint --prefix $rootDir/typescript/pub) && \

    if [ $localInterfaceFingerPrint != $remoteInterfaceFingerprint ]
    then
        "$scriptDir/publishWithoutChecks.sh" "minor"
    else
        "$scriptDir/publishIfContentChanged.sh" "patch"
    fi
fi