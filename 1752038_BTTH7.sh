#! /bin/bash

makeAMakeFile() {
    echo -n -e "all: exo \nexo:"
    for i in $*; do
	echo -n " ${i/.c/.o}"
    done
    echo -n -e "\n\tgcc"
    for i in $*; do
	echo -n " ${i/.c/.o}" 
    done
    echo " -o exo"
    for i in $*; do
	echo -e "${i/.c/.o}: $i\n\tgcc -c $i"
    done
    echo -e "clean:\n\trm -f *.o exo\ndepend:\n\tmakedepend *.c"
}

makef=${*##*/}
makefile() {
    if test -e $*; then
	echo -n "Nhap danh sach cac file .c: "
	read file
	exec 3>|$makef
	makeAMakeFile $file >&3
	exec 3>&-
    else
	echo "Duong dan khong hop le!"
	exit 1
    fi
}

makefile $*