#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

rm -rf $rootDir/dev/dist && \
rm -rf $rootDir/dev/node_modules && \
rm -rf $rootDir/pareto/dist && \
rm -rf $rootDir/pareto/node_modules && \
rm -rf $rootDir/pub/dist && \
rm -rf $rootDir/pub/node_modules && \
rm -rf $rootDir/test/dist && \
rm -rf $rootDir/test/node_modules