#! /bin/bash

flag_countline=false
flag_find=false
flag_all=false

showHelp()
{
    echo "$0 [-h|--help][-a|--all][-f|--find filename][-c|--countfilename][dir]"
}

showAllFiles()
{
    if [ -d $1 ]
    then
	files="$1/*"
	for file in $files
	do
	    echo ${file##*/}
	done
    else
	echo "Duong dan khong ton tai"
	exit
    fi
}

findFile()
{
    local dir="$1"
    local filename="$2"
    for d in $dir/*; do
	fname=${d##*/}
	if [ "$fname"="$filename" ]; then
	    echo "$d"
	fi
    done
}

countLines()
{
    local dir="$1"
    if ! [ -f $dir ]; then
	echo "Khong ton tai"
	exit 1
    elif ! [ -r $dir ]; then
	    echo "Khong co quyen doc"
    else
	echo "${dir##*/}"
        echo $( wc -l < $dir )
    fi
}

showInfos ()
{
    if $flag_countLine; then
	echo $(countLines /home/miknguyet99/input.txt)
    fi
    if $flag_find; then
	echo $(findFile /home/miknguyet99/Documents)
    fi
    if $flag_all; then
	echo $(showAllFiles /etc)
    fi
}

while [ $# -ge 1 ]; do
    case $1 in
      -h|--help) showHelp
	    exit 1
	    ;;
      -a|--all) flag_all=true
	    shift
	    ;;
      -f) flag_find=true
	    shift
	    filename1="$choose"
	    ;;
      -c|--countline) flag_countLine=true
	    shift
	    ;;
       *) echo "Khong co gi ca" 
	    exit 1
	    ;;
    esac
done
showInfos