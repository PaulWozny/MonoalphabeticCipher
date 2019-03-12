#!/usr/bin/env bash

#Pobierz slownik z internetu i odpowiednio go sparsuj:

if [ ! -f 'PL_dict.txt' ]; then
wget --quiet -O - https://raw.githubusercontent.com/djstrong/PL-Wiktionary-To-Dictionary/master/dictionaries/polish_english.txt | tail -n +16 | sed 's/-.*$//g' > PL_dict.txt

sed 's/\(.\)/\1\n/g' PL_dict.txt | sort | uniq -ic | tail -n +10 | sort -k1 -n -r > PL_occur.txt
fi
cat Czestotliwosc wystepowania znakow w jezyku polskim:
cat  PL_occur.txt

#Sprawdz czy zostal podany tekst zakodowany
if [ -z $1 ]; then
echo "Podaj jako argument tekst do deszyfrowania"
exit
elif [ ! -f $1 ]; then
echo "Plik nie istnieje"
exit
fi

# posortuj wyrazy w szyfrogramie od najdluzszego:
echo
echo Tekst w szyfrogramie
cat $1 | sed 's/ /\n/g' | sort | uniq | awk '{print length, $0}' | sort -nr | head


#policz ilość wystepowania znakow w szyfrogramie:
sed 's/\(.\)/\1\n/g' "testszyft.txt" | sort | uniq -ic  | sort -k1 -n -r
