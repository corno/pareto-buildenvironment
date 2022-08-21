#!/usr/bin/env bash

if [ -d "../dev" ]
then
    "$(dirname "$0")"/buildDevPackage.sh && \
    rm -rf ../pub/src/generated && \
    rm -rf ../test/src/generated && \
    node ../dev/dist/bin/generateCode.js ..
fi \


"$(dirname "$0")"/buildPubAndTestPackages.sh && \
if [ -d "../test" ]
then
    node ../test/dist/bin/index.js ../test/data
fi \

