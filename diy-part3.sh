#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part3.sh
# Description: OpenWrt DIY script part 3 (After Download package)
#

#获取内核版本
linuxVersionAll=$(head -1 include/kernel-5.10)
linuxVersion="5.10"$(echo ${linuxVersionAll#*=})
#新建临时目录
#mkdir tmp
ls dll
cat include/kernel-5.10
#下载驱动文件
wget -P dll https://github.com/Rainswr/i350/releases/download/v1.0.0/igb-5.8.5.tar.gz
#解压驱动文件到临时目录
tar -xzvf dll/igb-5.8.5.tar.gz -C tmp
#解压内核文件到临时目录并进入临时目录删除原本驱动文件并返回原来目录
tar -Jxf dll/linux-$linuxVersion.tar.xz -C tmp && cd tmp/linux-$linuxVersion/drivers/net/ethernet/intel/igb && rm -rf * && cd ../../../../../../../
#移动新的驱动文件到内核
mv -f tmp/igb-5.8.5/src/* tmp/linux-$linuxVersion/drivers/net/ethernet/intel/igb
#删除驱动缓存和旧的内核文件
rm -rf dll/linux-$linuxVersion.tar.xz && rm -rf tmp/igb-5.8.5
#再次进入临时目录并打包内核
cd tmp && tar -Jcf ../dll/linux-$linuxVersion.tar.xz linux-$linuxVersion --remove-files && cd ..
#获取新打包内核哈希并更新至文件
linuxHashAll=$(sha256sum dll/linux-$linuxVersion.tar.xz)
linuxHash=${linuxHashALL:0:65}
sed -i 's/[a-zA-Z0-9]{65}/$linuxHash/g' include/kernel-5.10
