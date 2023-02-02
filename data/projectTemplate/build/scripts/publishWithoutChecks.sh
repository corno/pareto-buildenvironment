#!/usr/bin/env bash
generation=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

#bump version and store in variable
newVersion=$(npm version "$generation") && \
echo "version bumped: $generation" && \

#commit package.json with new version number
git add $rootDir && \
git commit -m "version bumped to $newVersion" && \

#create a tag
git tag -a "$newVersion" -m "$newVersion" && \
git push && \

#publish
pushd "$rootDir/pub" > /dev/null && \
npm publish && \
popd
