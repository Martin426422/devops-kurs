#!/usr/bin/env bash

if [ ! -d "$1" ]
then
    echo "Podaj katalog"
    exit 1
fi

declare -A stat

najwiekszy=""
max=0

while read -r plik
do
    nazwa=$(basename "$plik")

    if [[ "$nazwa" == *.* ]]
    then
        ext="${nazwa##*.}"
    else
        ext="(brak)"
    fi

    (( stat["$ext"]++ ))

    rozmiar=$(stat -c%s "$plik")

    if [ "$rozmiar" -gt "$max" ]
    then
        max=$rozmiar
        najwiekszy=$plik
    fi

done < <(find "$1" -type f 2>/dev/null)

echo "Rozszerzenie     Liczba"
echo "------------------------"

for ext in "${!stat[@]}"
do
    printf "%-15s %5d\n" "$ext" "${stat[$ext]}"
done | sort -k2 -nr

echo

pliki=$(find "$1" -type f 2>/dev/null | wc -l)
katalogi=$(find "$1" -type d 2>/dev/null | wc -l)

echo "Liczba plików: $pliki"
echo "Liczba katalogów: $katalogi"
echo "Największy plik: $najwiekszy"
echo "Rozmiar: $max bajtów"
