#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

if [ -z "$1" ]
  then
    echo "No generation supplied"
fi

generation=$1

rootDir=`realpath "$scriptDir/../.."`
pubDir="$rootDir/typescript/pub"

if [ -d "$pubDir" ]
then
    pushd "$pubDir" > /dev/null && \

    #I want to have a fingerprint of the content of an npm package to be able to see if the local data is
    #identical to what was already published. If that is the case, there is nothing to publish
    #the version should not be part of that
    #if I publish the exact same package under 2 version numbers, the fingerprint should be the same


    #first take care of the interface fingerprint
    # apiDir="./src/"
    # if [ -d "$apiDir" ]
    # then
    #     npm pkg set interface-fingerprint=`tar -cf - $apiDir | shasum | cut -c1-40`
    # else
    #     npm pkg delete interface-fingerprint #delete if it was there
    # fi

    #now take care of the content fingerprint

    npm pkg set name="x" --prefix $pubDir && \
    npm pkg set version="0.0.0" --prefix $pubDir && \
    npm pkg delete content-fingerprint --prefix $pubDir && \
    npm pkg delete interface-fingerprint --prefix $pubDir
    #create a package, but don't store it (--dry-run), let the summary output be json
    #create a shasum of that and then trim to the first 40 characters of that shasum (the rest is filename info, which in this case is: ' -')
    contentfingerprint=$(npm pack --dry-run --json --prefix $pubDir | shasum | cut -c1-40)
    npm pkg set content-fingerprint="$contentfingerprint" --prefix $pubDir && \

    name=`basename $rootDir` && \
    npm pkg set name="$name" --prefix $pubDir && \
    npm pkg set repository.url="http://github.com/corno/$name.git" --prefix $pubDir && \

    remoteVersion=$(npm view $name@latest version --prefix $pubDir) && \

    npm pkg set version="$remoteVersion" --prefix $pubDir && \
fi


