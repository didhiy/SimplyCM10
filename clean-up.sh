#!/bin/bash

if [ "$CPU_JOB_NUM" = "" ] ; then
	CPU_JOB_NUM=`grep -c processor /proc/cpuinfo`
fi

KERNEL_BUILD_DIR=/media/DATA2/NitestGit/android_kernel_samsung_epicmtd
case "$1" in
	clean)
		pushd $KERNEL_BUILD_DIR
		make clean
		popd
		;;
	mrproper)
		pushd $KERNEL_BUILD_DIR
		make clean
		make mrproper
		popd
		;;
	distclean)
		pushd $KERNEL_BUILD_DIR
		make clean
		make distclean
		popd
		;;

	*)
		echo "usage: [clean|mrproper|distclean]"
		;;
esac
