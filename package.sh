#!/bin/bash

set -x -e

VERSION=`grep '^version' Cargo.toml | cut -d '"' -f 2`
echo "Packaging version ${VERSION}..."
cargo clean
docker run --rm -v `pwd`:/volume clux/muslrust cargo build --release
zip -j limpet_${VERSION}_linux_amd64.zip  target/x86_64-unknown-linux-musl/release/limpet

