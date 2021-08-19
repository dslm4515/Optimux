#! /bin/bash

if [ "$1" != "" ]; then
    echo "[  ii  ] rootfs set at $1 " && \
    export LFS=$1 && \
    echo "WARNING! Make sure built (M)LFS has virtual kernel filesystems unmounted." && \
    echo "WARNING! Do not run this in chroot." && \
    echo "Are virtual kernel filesystems for chroot unmounted and script not running in chroot?" && \
    read -p "Yes [enter] / No [ctrl + c ] " && \
    echo "Backing up (M)LFS build (rootfs) to /tmp/LFS-rootfs" && \
    mkdir -pv /tmp/LFS-rootfs && \
    cd $LFS && \
    for d in bin boot dev etc home lib media mnt opt proc root run sbin srv sys tmp usr var
    do
	    printf "Packing up... $d "
	    tar Jcpf /tmp/LFS-rootfs/$d.tar.xz $d
	    printf " ...done \n"
    done && \
    echo "Backup complete. Total backup size:" && \
    du -ch /tmp/LFS-rootfs 
else
    echo "[ STOP ] LFS not set. Please set. Usage: spanned-backup.sh [rootfs] "
fi
