#! /bin/bash

flag_help=false
flag_find=false
flag_count=false
flag_add=false
flag_del=false

showHelp() {
    echo "[-h|--help]/[-f|--find]/[-c|--count]/[-a|--add]/[-d|--delete] danhba.txt"
}

find() {
    echo -n "Nhap tu can tim: "
    read a
    while read line; do
	for word in $line; do
	    if [[ $word == $a ]]; then
		echo $line
		return
	    fi
	done
    done <danhba.txt
}

count() {
    i=0
    echo -n "So muc: "
    while read line; do
	(( i++ ))
    done<danhba.txt
    echo $i
}

add() {
    echo "Nhap thong tin danh ba can them: "
    echo -n "Last name: "
    read ho
    echo -n "First name: "
    read ten
    echo -n "Phone: "
    read sdt
    echo "Last Name: $ho ; First Name: $ten ; Phone: $sdt" >>danhba.txt
}

flag=false
delete() {
    echo -n "Nhap ten muc can xoa: "
    read name

    touch temp.txt; cp danhba.txt temp.txt
    mark=0
    while read line; do
	(( mark++ ))
	for word in $line; do
	    if [[ $word == $name ]]; then
		flag=true
       		break
	    fi
	done
	if $flag; then
	    break
	fi
    done <danhba.txt
    i=0
    while read line; do
	mark=$(( mark-1 ))
	if (( i==0 )); then
	    if (( mark>0 )); then
		echo $line >danhba.txt
	    else
		echo "" >danhba.txt
	    fi
	else
	    if (( mark==0 )); then
		continue
	    else
		echo $line >>danhba.txt
	    fi
	fi
	(( i++ ))
    done <temp.txt
    rm temp.txt
    echo "Danh ba da duoc cap nhat!"
}

case $1 in
    -h|--help) flag_help=true
        shift
        ;;
    -f|--find) flag_find=true
        shift
        ;;
    -c|--count) flag_count=true
        shift
        ;;
    -a|--add) flag_add=true
        shift
        ;;
    -d|--delete) flag_del=true
	shift
	;;
     *) echo "Khong co gi" 
        exit 1
        ;;
esac

showInfor() {
    if $flag_help; then
	echo $(showHelp)
    fi
    if $flag_find; then
	find $*
    fi
    if $flag_count; then
	count $*
    fi
    if $flag_add; then
	add $*
    fi
    if $flag_del; then
	delete $*
    fi
}

input="$2"
readFile() {
    if test -e $2; then
	showInfor $2
    else
	echo "File khong ton tai"
	exit 1
    fi
}

process() {
    local input="$2"
    readFile $input
}
process $input