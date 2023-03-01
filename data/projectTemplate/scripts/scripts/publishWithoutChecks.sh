#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

if [ -z "$1" ]
  then
    echo "No generation supplied"
fi

generation=$1

rootDir=`realpath "$scriptDir/../.."`
buildDir="$rootDir/scripts"
pubDir="$rootDir/typescript/pub"

#bump version and store in variable
newVersion=$(npm version "$generation" --prefix $pubDir) && \
echo "version bumped: $generation" && \

#check for updates before committing, this alters the package-lock.json slightly
"$scriptDir/updateNPMPackageDependencies.sh" "$pubDir"

#commit package.json with new version number
git --git-dir $rootDir add . && \
git --git-dir $rootDir commit -m "version bumped to $newVersion" && \

#create a tag
git --git-dir $rootDir tag -a "$newVersion" -m "$newVersion" && \
git --git-dir $rootDir push && \

#publish
npm publish --prefix $pubDir && \
