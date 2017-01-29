#!/bin/bash

set -eu

# check usage
if [[ $# -ne 1 ]]; then
  cat << EOF
Usage: `basename $0` version
Update the application version shipped by this package.
EOF
  exit 1
fi

version=$1

# -- helper:
# check that the version is set in a given file.
check_version() {
  grep -q "$version" "$1" \
    && echo "[OK]" \
    || echo "[ERROR]"
}

# set new version
echo ":: set new version: ${version}"

echo -n "- processing 'scripts/_common.sh'... "
sed -ri "s#^(VERSION=).*#\1\"${version}\"#" \
    ./scripts/_common.sh
check_version "./scripts/_common.sh"

echo -n "- processing 'manifest.json'... "
sed -ri "s#(\"version\":).*#\1 \"${version}\",#" \
    manifest.json
check_version "./manifest.json"

echo -n "- processing 'README.md'... "
sed -ri "s#(\*\*Shipped version:\*\*).*#\1 ${version}#" \
    README.md
check_version "./README.md"

source ./scripts/_common.sh

# download and calculate the checksum
echo ":: downloading source tarball..."
rm -f "source.tar.gz"
wget -O "source.tar.gz" "$WALLABAG_SOURCE_URL"
calc_sum=$(sha256sum "source.tar.gz" | awk '{print $1}')

# set new checksum
echo ":: set new checksum: ${calc_sum}"
sed -ri "s#^(WALLABAG_SOURCE_SHA256=).*#\1\"${calc_sum}\"#" \
    ./scripts/_common.sh

echo "DONE!"
