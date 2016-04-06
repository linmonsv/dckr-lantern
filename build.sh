#!/bin/bash
set +e

OsType="$(uname -s 2>&1 | tr '[:upper:]' '[:lower:]')"; if [ "${OsType}" == "darwin" ]; then docker-machine start default; eval "$(docker-machine env default)"; fi

# Build latest latern
git clone https://github.com/getlantern/lantern.git
cd lantern
git checkout -b 2.1.2
make
cd ..

if [ ! -f lantern/lantern_linux_amd64 ]; then
    echo "Build fail. Latern binary do not exist"
    exit 1
fi
cp -v lantern/lantern_linux_amd64 .
rm -rf ./lantern

docker build --rm -t webdeskltd/lantern .

rm ./lantern_linux_amd64

if [ "${OsType}" == "darwin" ]; then docker-machine stop default; fi
