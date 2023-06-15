#!/bin/bash

export GNUPGHOME=$(mktemp -d)

mkdir -p $1

build="$1"
keyring="$2"
trusted="$3"
revoked="$4"
shift 4

touch $trusted $revoked

for key in $*; do
    fingerprint=$(gpg -q --keyid-format long -v $key | grep -oE '[0-9A-Z]{40}$')
    gpg --import $key
    echo "${fingerprint}:4:" >> $trusted
    # TODO: manage revoked keys
done

gpg --export --armor > $keyring

rm -rf $GNUPGHOME
