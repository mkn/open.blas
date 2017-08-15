#!/usr/bin/env bash

set -e

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ -z "$(which cmake)" ] && echo "cmake is required to build singa" && exit 1;

THREADS="$(nproc --all)"
VERSION="master"
GIT_URL="https://github.com/xianyi/OpenBLAS"
DIR="blas"

HAS=1
[ ! -d "./$DIR" ] && HAS=0 && git clone --depth 1 $GIT_URL -b $VERSION $DIR --recursive
[ $HAS -eq 1 ] && cd $DIR && git pull origin $VERSION && cd ..

pushd $CWD/$DIR
make clean
make ONLY_CBLAS=1 -j$THREADS
make PREFIX=$CWD/inst install
popd

echo "finished"
exit 0
