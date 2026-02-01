#!/usr/bin/bash

if [ $# -lt 2 ] || [ $# -gt 3 ]; then
    echo "USAGE: $(basename $0) <PATH> <OUT> [--yes]"
    exit 1
fi

TARGET=$1
OUT=$2
CONFIRM=$3

if [ -d "$OUT" ]; then
    OUT="$(realpath ${OUT})/$(basename $TARGET).gpgtar"
else
    mkdir -p $(dirname $OUT)
fi

BASE_OUT=$OUT
i=0
while [ -f $OUT ]; do
    OUT="${BASE_OUT}${i}"
    ((i = i + 1))
done

read -p "Password: " -s PASS
echo

if [ ${#PASS} -eq 0 ]; then
    echo "Bad password"
    exit 2
fi

read -p "Confirm password: " -s PASS2
echo

if [ ${PASS} != ${PASS2} ]; then
    echo "Passwords don't match"
    exit 3
fi

gpgtar -c -o $OUT --batch --gpg-args "--passphrase ${PASS}" $TARGET

if [ $? -ne 0 ]; then
    echo "Something gone wrong"
    exit 4
fi

echo "Created at $OUT"

