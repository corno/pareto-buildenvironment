#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

#make sure everything is pushed
git push && \

#validate that everything is committed and pushed (to make sure we're not messing with open work with updatePackage)
git diff --exit-code && git log origin/master..master --exit-code && \

#make sure latest buildenvironment is installed
"$scriptDir/update2latestBuildEnvironment.sh" && \

"$scriptDir/clean.sh" && \

#update packages and build
"$scriptDir/update2latestDependenciesAndBuild.sh" && \

#validate that everything is still committed after the update and build
git diff --exit-code && git log origin/master..master --exit-code && \

#bump version and store in variable
pushd "$rootDir/pub" > /dev/null && \


root="`cd "$rootDir";pwd`" # the resolved path to the root dir of the project
name=`basename $root`

"$scriptDir/setDynamicPackageData.sh" && \

if [ -d "$rootDir/pub/src/bin" ]
then
    find "$rootDir/pub/src/bin/*" -name "*.js" -exec chmod 777 {} +
fi && \


#remoteContentFingerprint=$(npm view $name@latest content-fingerprint) && \

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