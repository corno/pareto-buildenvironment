#!/usr/bin/env bash
generation=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

pushd "$rootDir/pub" > /dev/null && \

#bump version and store in variable
newVersion=$(npm version "$generation") && \
echo "version bumped: $generation" && \

popd > /dev/null && \

#check for updates before committing, this alters the package-lock.json slightly
npx npm-check-updates -u --packageFile "$rootDir/pub/package.json" && \

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
