#! /bin/bash

FLAG_SUM=0
FLAG_MULT=0

showHelp () {
    echo "$0 [-h|--help] [-s|--sum] [-m|--mult] list_of_number"
}
displayList () {
    for i in $*; do
	echo "$i"
    done
}
sum () {
    tong=0
    for i in $*; do
	tong=$((tong+i))
    done
    echo "tong cac so la $tong"
}
mult () {
    tich=1
    for i in $*;do
	tich=$((tich*i))
    done
    echo "tich cac so la $tich"
}
showResult () {
   echo $(sum 1 2 3)
   echo $(mult 1 2 3)
}

if $sum; then
    FLAG_SUM=1
fi
if $mult; then
    FLAG_MULT=1
fi

showHelp a
displayLis
t 1 2 3 4 5
if (( $FLAG_MULT && $FLAG_SUM )); then
    showResult
fi