#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

#make sure everything is pushed
git push && \

#validate that everything is committed and pushed (to make sure we're not messing with open work)
git diff --exit-code && git log origin/master..master --exit-code && \

"$scriptDir/buildFromScratch.sh" && \

#validate that everything is still committed after the update and build
git diff --exit-code && git log origin/master..master --exit-code && \

pushd "$rootDir/pub" > /dev/null && \

"$scriptDir/setDynamicPackageData.sh" && \

if [ -d "$rootDir/pub/src/bin" ]
then
    find "$rootDir/pub/src/bin/*" -name "*.js" -exec chmod 777 {} +
fi && \

rawLocalInterfaceFingerPrint=`npm pkg get interface-fingerprint` && \
if [ $rawLocalInterfaceFingerPrint == "{}" ]
then
    #no interface fingerprint

    "$scriptDir/publishIfContentChanged.sh" "minor"

else

    localInterfaceFingerPrint=$($rawLocalInterfaceFingerPrint | cut -c2- | rev | cut -c2- |rev) && \
    remoteInterfaceFingerprint=$(npm view $name@latest interface-fingerprint) && \

    if [ $localInterfaceFingerPrint != $remoteInterfaceFingerprint ]
    then
        "$scriptDir/publishWithoutChecks.sh" "minor"
    else
        "$scriptDir/publishIfContentChanged.sh" "patch"
    fi
fi