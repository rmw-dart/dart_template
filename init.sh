#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")"; pwd)
set -ex
cd $DIR

direnv allow

./.init.coffee

git add -u && git commit -m. && git push

