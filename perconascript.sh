#!/bin/bash
target_dir=/backup/data/bkp_`date +%Y"_"%m"_"%d`
Tk_bkp()
{
mkdir $target_dir
xtrabackup --backup --datadir=/var/lib/mysql/ --target-dir=$target_dir
}

if [ ! -d $target_dir ]
then
Tk_bkp
else
rm -rf $target_dir
Tk_bkp
fi
rsync -avzhe ssh $target_dir root@107.160.101.240:/backup
