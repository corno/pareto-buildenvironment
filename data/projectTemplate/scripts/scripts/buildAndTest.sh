#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

"$scriptDir/generateTypescript.sh" && \
"$scriptDir/buildPubAndTestPackages.sh" && \
"$scriptDir/test.sh"