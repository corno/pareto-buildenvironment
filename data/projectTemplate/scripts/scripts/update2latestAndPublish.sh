#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

"$scriptDir/assertNoOpenGitChanges.sh" && \

#assure it's currenly succesfully building and testing
"$scriptDir/buildAndTest.sh" && \

"$scriptDir/assertNoOpenGitChanges.sh" && \

#rebuild with latest dependencies
"$scriptDir/buildFromScratch.sh" && \

git add -a && git commit -m "." && git push && \

"$scriptDir/publish.sh"