#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

rm -rf $rootDir/.gitignore && \

rm -rf $rootDir/build/scripts && \
rm -rf $rootDir/build/node_modules && \
rm -rf $rootDir/build/package-lock.json && \

rm -rf $rootDir/dev/dist && \
rm -rf $rootDir/dev/package-lock.json && \
rm -rf $rootDir/dev/node_modules && \

rm -rf $rootDir/pareto/dist && \
rm -rf $rootDir/pareto/package-lock.json && \
rm -rf $rootDir/pareto/node_modules && \

rm -rf $rootDir/pub/dist && \
rm -rf $rootDir/pub/node_modules && \
rm -rf $rootDir/pub/package.json && \
rm -rf $rootDir/pub/package-lock.json && \
rm -rf $rootDir/pub/tsconfig.json && \
find $rootDir/pub/src -name "index.ts" -exec rm {} \; && \
find $rootDir/pub/src -name "*.generated.ts" -exec rm {} \; && \

rm -rf $rootDir/test/dist && \
rm -rf $rootDir/test/node_modules && \
rm -rf $rootDir/pub/package.json && \
rm -rf $rootDir/pub/package-lock.json && \
rm -rf $rootDir/pub/tsconfig.json