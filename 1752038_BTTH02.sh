#! /bin/bash
#cau1
sudo su
adduser sinhvien01
adduser sinhvien02
adduser sinhvien03
adduser giaovien01
adduser giaovien02
groupadd gr_sinhvien
groupadd gr_giaovien
usermod -G gr_sinhvien sinhvien01
usermod -G gr_sinhvien sinhvien02
usermod -G gr_sinhvien sinhvien03 
usermod -G gr_giaovien giaovien01
usermod -G gr_giaovien giaovien02
cd /home
cd giaovien01
touch debai.txt
echo "Hello World">>debai.txt
cd ..
groupadd gr_debai
usermod -G gr_debai sinhvien01
usermod -G gr_debai sinhvien02
usermod -G gr_debai sinhvien03
usermod -G gr_debai giaovien01
usermod -G gr_debai giaovien02
mkdir sinhvien01/debai
mkdir sinhvien02/debai
mkdir sinhvien03/debai
chgrp gr_debai sinhvien01/debai
chgrp gr_debai sinhvien02/debai
chgrp gr_debai sinhvien03/debai
chmod ugo+x sinhvien01/debai
chmod ugo+x sinhvien02/debai
chmod ugo+x sinhvien03/debai
cp giaovien01/debai.txt sinhvien01/debai/
cp giaovien01/debai.txt sinhvien02/debai/
cp giaovien01/debai.txt sinhvien03/debai/
cd sinhvien01
touch bainop.txt
echo "Da Hoan Thanh">>bainop.txt
cd ..
cp sinhvien01/bainoptxt giaovien02
chown gr_giaovien sinhvien01/bainop.txt

#cau2
umask
chmod ug+rw file.txt
chmod ugo+x file1.txt
chmod ugo+rw file2.txt
chmod 744 file3.txt
