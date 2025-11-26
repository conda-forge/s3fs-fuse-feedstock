#!/usr/bin/env bash
set -ex

# Replicates behavior of autogen.sh when .git is missing
echo "" > default_commit_hash

# Run autotools commands individually (skipping autoupdate which can fail)
aclocal
autoheader
automake --add-missing
autoconf

./configure \
  --prefix=${PREFIX} \
  --sbindir=${PREFIX}/bin \
  --with-openssl

make

make install
