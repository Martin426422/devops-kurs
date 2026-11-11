#!/usr/bin/env bash

if [ -d "$1" ]
then
    echo "Katalog istnieje"
else
    echo "Katalog nie istnieje" >&2
	exit 1
fi

zrodlo="$1"

data=$(date +%Y%m%d-%H%M%S)

if [ -z "$2" ]
then
	cel="$HOME/kopie"
else
	cel="$2"
fi

mkdir -p "$cel"

archiwum="$cel/kopia-$data.tar.gz"

tar -czf "$archiwum" "$zrodlo"

echo "Utworzono: $archiwum"

du -h "$archiwum"

echo "Test integralności:"

tar -tzf "$archiwum"
