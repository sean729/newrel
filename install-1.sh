#!/usr/bin/env bash

# Install the New Relic CLI.
# https://github.com/sean729/newrel/install-1.sh
#
# Dependencies: curl, cut, tar, gzip
#
# /usr/local/bin/newrelic install -n node-agent-installer
#


echo "Starting installation."

# Determine release filename. This can be expanded with CPU arch in the future.

VERSION="0.28.12"


echo "Installing New Relic CLI v${VERSION}"

# Run the script in a temporary directory that we know is empty.
SCRATCH="tmp"
mkdir $SCRATCH
cd "$SCRATCH"

RELEASE_URL="https://github.com/newrelic/newrelic-cli/releases/download/v0.28.12/newrelic-cli_0.28.12_Linux_x86_64.tar.gz"
DESTDIR="${DESTDIR:-/usr/local/bin}"

echo "Download & unpack the release tarball to ${DESTDIR}."
curl -sL --retry 3 "${RELEASE_URL}" | tar -xz

    echo "Installing to $DESTDIR"
    mv newrelic "$DESTDIR"
    chmod +x "$DESTDIR/newrelic"
    chown root:0 "$DESTDIR/newrelic"

# Delete the working directory when the install was successful.
#rm -r "$SCRATCH"
