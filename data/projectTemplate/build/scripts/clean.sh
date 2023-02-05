#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

rm -rf $rootDir/.gitignore && \
rm -rf $rootDir/tmp && \

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
pushd "$rootDir/pub" > /dev/null && \
find ./src -name "index.ts" -exec rm {} \; && \
find ./src -name "*.generated.ts" -exec rm {} \; && \
popd > /dev/null && \


rm -rf $rootDir/test/dist && \
rm -rf $rootDir/test/node_modules && \
rm -rf $rootDir/pub/package.json && \
rm -rf $rootDir/pub/package-lock.json && \
rm -rf $rootDir/pub/tsconfig.json && \

rm -rf $rootDir/build/node_modules && \
rm -rf $rootDir/build/package-lock.json && \
rm -rf $rootDir/build/scripts