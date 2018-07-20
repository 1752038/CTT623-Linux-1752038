#! /bin/bash

FLAG_DISPLAY=false
FLAG_SUM=false
FLAG_PRODUCT=false

showHelp() {
    echo "$0 [-a|--all] [-d|--display] [-s|--sum] [-p|--product] input_file output_file"
}

lenghList() {
    echo "Do dai $#"
}

displayList() {
    echo "$(lenghList $*)"
    for i in $*; do
	echo $i
    done
}

sumInt() {
    sum=0
    for i in $*; do
	sum=$(( sum+i ))
    done
    echo "Tong la $sum"
}

productInt() {
    produ=0
    for i in $*; do
	produ=$(( produ*i ))
    done
    echo "Tich la $produ"
}

readFile() {
    if test -d $1; then
	while read line1<&3; do
	    echo ""
}

while [ $# -gt 2 ]; do
    case $1 in
      -a|--all) FLAG_DISPLAY=true
	    FLAG_SUM=true
	    FLAG_PRODUCT=true
	    shift
	    ;;
      -d|--display) FLAG_DISPLAY=true
	    shift
	    ;;
      -s|--sum) FLAG_SUM=true
	    shift
	    ;;
      -p|--product) FLAG_PRODUCT=true
	    shift
	    ;;
       *) echo "$(showHelp)"
	    exit 1
	    ;;
    esac
done

showInfos ()
{
    if $FLAG_DISPLAY; then
	echo "$(displayList 1 2 3 4)"
    fi
    if $FLAG_SUM; then
	echo "$(sumInt 1 2 3 4)"
    fi
    if $FLAG_PRODUCT; then
	echo "$(productInt 1 2 3)"
    fi
}

showInfosif [ $# -lt 2 ]; then
    showHelp
    exit 1
fi


while [ $# -gt 2 ]; do
    
    case $1 in
	-a|--all) FLAG_DISPLAY=true
	    FLAG_SUM=true
	    FLAG_PRODUCT=true
	    shift
     	    ;;
        -d|--display) FLAG_DISPLAY=true
	    shift
	    ;;
	-s|--sum) FLAG_SUM=true
	   shift
	    ;;
	-p|--product) FLAG_PRODUCT=true
	    shift
	    ;;
	*) echo "khong gi ca" 
	    exit 1
    esac
done

input="$1"
output="$2"
showInfos ()
{
    if $FLAG_DISPLAY; then
	displayList $*
    fi
    if $FLAG_SUM; then
	sumInt $*
    fi
    if $FLAG_PRODUCT; then
	productInt $*
    fi
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