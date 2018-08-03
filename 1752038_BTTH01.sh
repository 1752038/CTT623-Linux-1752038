#! /bin/bash
whoami
ls 
ls -la
bash --vesion
mkdir BaiTapLinux
mkdir BTTH
mkdir BTTL
pwd
mv BTTH BaiTapLinux
mv BTTL BaiTapLinux
cd BaiTapLinux/BTTH
touch templace.txt
echo "Ho va ten: " >>templace.txt
echo "MSSV: " >>templace.txt
echo "TenBaiTap: " >>templace.txt
cat templace.txt
mkdir BTTH01
cp templace.txt BTTH01
cd BTTH01
mv templace.txt 1752048_btth01.sh
cd ..
chmod ugo+x BTTH01/1752048_btth01.sh
echo "Hello World"
MESSAGE="Hello World"
echo $MESSAGE
echo "Nhap so: "; read a
if ((a>0)); then
    echo "So duong"
elif ((a<0)); then
    echo "So am"
else
    echo  "So 0"
fi

if ((a%2==0)); then
    echo "So chan"
else 
    echo "So le"
fi
i=0
while ((a>=i));do
    echo -n -e "$i\t";
    ((i++))
done