#!/bin/bash

PROG=85
ZRODLO="domyślna"

CONFIG="$HOME/.config/dysk.conf"

if [ -f "$CONFIG" ]; then
    while IFS='=' read -r key value; do
        case "$key" in
            PROG)
                PROG="$value"
                ZRODLO="plik"
                ;;
            *)
                echo "WARN: nieznany klucz $key"
                ;;
        esac
    done < "$CONFIG"
fi

if [ -n "${PROG_ENV:-}" ]; then
    PROG="$PROG_ENV"
    ZRODLO="środowisko"
fi

if [ "$1" = "--pokaz-konfiguracje" ]; then
    echo "PROG=$PROG (źródło: $ZRODLO)"
    exit 0
fi

while getopts "p:h" opt; do
    case "$opt" in
        p)
            PROG="$OPTARG"
            ZRODLO="wiersz poleceń"
            ;;
        h)
            echo "Użycie: $0 [-p PROCENT] [--pokaz-konfiguracje]"
            exit 0
            ;;
        *)
            echo "Nieznana opcja"
            exit 1
            ;;
    esac
done

WYNIK=0

while read -r _ use mount; do
    use=${use%\%}

    if [ "$use" -ge "$PROG" ]; then
        echo "WARN: $mount zajęty w ${use}%"
        WYNIK=1
    fi
done < <(df -P | awk 'NR > 1 {print $1, $5, $6}')

exit "$WYNIK"
