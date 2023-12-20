#!/bin/bash

set -x -e

rustup target add aarch64-unknown-linux-musl
rustup target add x86_64-unknown-linux-musl

VERSION=`grep '^version' Cargo.toml | cut -d '"' -f 2`
echo "Packaging version ${VERSION}..."
cargo clean

cargo build --release --target x86_64-unknown-linux-musl --target aarch64-unknown-linux-musl

zip -j limpet_${VERSION}_linux_amd64.zip  target/x86_64-unknown-linux-musl/release/limpet
zip -j limpet_${VERSION}_linux_arm64.zip target/aarch64-unknown-linux-musl/release/limpet
