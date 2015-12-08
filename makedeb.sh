#!/bin/bash

set -e
set -x

VERSION=0.8.0-2
MAINTAINER="Nick Groenen <nick@groenen.me>"
DESCRIPTION="Log file navigator"
URL="https://github.com/zoni/lnav"

./autogen.sh
./configure
make -j 4

fpm -t deb -s dir -C src --name lnav --version "$VERSION" --maintainer "$MAINTAINER" --description "$DESCRIPTION" --url "$URL" --deb-compression xz --deb-no-default-config-files --prefix /usr/bin lnav
