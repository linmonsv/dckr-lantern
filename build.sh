#!/bin/bash
set +e

# Build latest latern
git clone https://github.com/getlantern/lantern.git
cd lantern
git checkout -b 2.2.5
make
cd ..

if [ ! -f lantern/lantern_linux_amd64 ]; then
    echo "Build fail. Latern binary do not exist"
    exit 1
fi
cp -v lantern/lantern_linux_amd64 .
rm -rf ./lantern

docker build --rm -t webdeskltd/lantern .
