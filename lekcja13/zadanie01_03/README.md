#WYNIKI TESTÓW
```
➜  zadanie01 git:(main) ✗ cat ~/.config/dysk.conf
PROG=70
➜  zadanie01 git:(main) ✗ export PROG_ENV=90
➜  zadanie01 git:(main) ✗ ./dysk.sh --pokaz-konfiguracje
PROG=90 (źródło: środowisko)
➜  zadanie01 git:(main) ✗ unset PROG_ENV
➜  zadanie01 git:(main) ✗ ./dysk.sh --pokaz-konfiguracje
PROG=70 (źródło: plik)
```
