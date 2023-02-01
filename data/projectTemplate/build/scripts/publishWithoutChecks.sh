#!/usr/bin/env bash
generation=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

root="`cd "$rootDir";pwd`" # the resolved path to the root dir of the project
name=`basename $root`

npm pkg set name="$name" && \
npm pkg set repository.url="http://github.com/corno/$name" && \

#bump version and store in variable
pushd "$rootDir/pub" > /dev/null && \

remoteVersion=$(npm view $name@latest version) && \

npm pkg set version="$remoteVersion" && \

newVersion=$(npm version "$generation") && \
echo "version bumped: $generation" && \
popd && \

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
