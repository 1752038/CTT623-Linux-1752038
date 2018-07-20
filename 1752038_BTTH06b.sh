#!/bin/bash

count() {
    echo "So tu: $#"
}

list() {
    for i in $*; do
	echo $i
    done
}

echo -n "Nhap tu muon tim trong input.txt: "
read char
countTime() {
    dem=0
    for i in $*; do
	if [[ $i = $char ]]; then
	    (( dem++ ))
	fi
    done
    echo "$char: xuat hien $dem lan"
}

input="$1"
showInfos () {
    count $*
    list $*
    countTime $*
}

readFile () {
    if test -e $1; then
	while read line; do
	    showInfos $line
	done <"$1"
    else
	echo "File khong ton tai"
	exit 1
    fi
}

process() {
    local input="$1"
    readFile $input
}
process $input