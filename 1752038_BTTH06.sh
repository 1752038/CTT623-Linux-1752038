#!/bin/bash

getLengthList() {
    echo "So luong $#"
}

displayList() {
    echo $(getLengthList $*)
    for i in $*; do
	echo $i
    done
}

getEvenNumber() {
    echo -n "So chan: "
    for i in $*; do
	if (( i%2==0 )); then
	    echo -n "$i "
	fi
    done
    echo " "
}

getOddNumber() {
    echo -n "So le: "
    for i in $*; do
	if (( i%2 )); then
	    echo -n "$i "
	fi
    done
    echo " "
}

getMax() {
    max=$1
    for i in $*; do
	if (( max<i )); then
	    max=$i
	fi
    done
    echo "Max: $max"
}

getMin() {
    min=$1
    for i in $*; do
	if (( min>i )); then
	    min=$i
	fi
    done
    echo "Min: $min"
}

getValueAt() {
    vitri=$1
    dem=1
    for i in $*; do
	if (( dem==vitri )); then
	    echo "Vi tri thu $vitri chua gia tri: $i"
	    return 1
	fi
	(( dem++ ))
    done
}

input="$1"
output="$2"
showInfos () {
    displayList $*
    getEvenNumber $*
    getOddNumber $*
    getMin $*
    getMax $*
    getValueAt $*
}

readFile () {
    if test -e $1; then
	exec 3>|$2
	while read line; do
	    showInfos $line  >&3
	done <"$1"
	exec 3>&-
    else
	echo "File khong ton tai"
	exit 1
    fi
}

process()
{
    local input="$1"
    local output="$2"
    readFile $input $output
}
process $input $output