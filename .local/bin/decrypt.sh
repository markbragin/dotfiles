#!/usr/bin/bash

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "USAGE: $(basename $0) <PATH> [<OUTPUT_DIR>]"
    exit 1
fi

TARGET=$1
OUTPUT_DIR=${2:-"."}

read -p "Password: " -s PASS
echo

if [ ${#PASS} -eq 0 ]; then
    echo "Bad password"
    exit 1
fi

gpgtar --directory $OUTPUT_DIR --decrypt --batch --gpg-args "--passphrase ${PASS}" $TARGET

if [ $? -ne 0 ]; then
    echo "Something gone wrong"
    exit 3
fi

echo "Decrypted to $OUTPUT_DIR"

