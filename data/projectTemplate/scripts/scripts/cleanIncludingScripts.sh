#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir=`realpath "$scriptDir/../.."`

"$scriptDir/cleanExcludingScripts.sh" && \

rm -rf "$rootDir/scripts/node_modules" && \
rm -rf "$rootDir/scripts/package-lock.json" && \
rm -rf "$rootDir/scripts/package.json" && \
rm -rf "$rootDir/scripts/scripts/*"
