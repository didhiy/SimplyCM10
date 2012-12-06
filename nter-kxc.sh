#!/bin/bash

if [ "$CPU_JOB_NUM" = "" ] ; then
	CPU_JOB_NUM=`grep -c processor /proc/cpuinfo`
fi

DEFCONFIG_STRING=cyanogenmod_epicmtd-nter_defconfig
PRJROOT=$PWD
CUSTOMVERSION=nitest-`date +%m%d`
KERNEL_BUILD_DIR=/media/DATA2/NitestGit/android_kernel_samsung_epicmtd
KEXEC_BUILD_DIR=$PRJROOT/kxc-zip

echo "Building kernel"
		pushd $KERNEL_BUILD_DIR
		START_TIME=`date +%s`
		make $DEFCONFIG_STRING
		make -j$CPU_JOB_NUM
		END_TIME=`date +%s`
		let "ELAPSED_TIME=$END_TIME-$START_TIME"
		echo "Total compile time is $ELAPSED_TIME seconds"
echo "Making kexec zip"
		pushd $KEXEC_BUILD_DIR
		cp $KERNEL_BUILD_DIR/arch/arm/boot/zImage $KEXEC_BUILD_DIR
		rm $PRJROOT/$CUSTOMVERSION-kxc.zip
		zip -r $PRJROOT/$CUSTOMVERSION-kxc.zip ./*
echo "Finish"
