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

#igbVersion="5.5.2"
##igbVersion="5.8.5"

##majorVersion="5.4"
#majorVersion="5.10"

#获取内核版本
##linuxVersionAll=$(head -1 include/kernel-$majorVersion)
##linuxVersion=$majorVersion$(echo ${linuxVersionAll#*=})
#新建临时目录
#mkdir tmp
ls dl
#下载驱动文件
##wget -P dl https://github.com/Rainswr/i350/releases/download/v1.0.0/igb-$igbVersion.tar.gz
#解压驱动文件到临时目录
##tar -xzvf dl/igb-$igbVersion.tar.gz -C tmp
#解压内核文件到临时目录并进入临时目录删除原本驱动文件并返回原来目录
##tar -Jxf dl/linux-$linuxVersion.tar.xz -C tmp && cd tmp/linux-$linuxVersion/drivers/net/ethernet/intel/igb && rm -rf * && cd ../../../../../../../
#移动新的驱动文件到内核
##mv -f tmp/igb-$igbVersion/src/* tmp/linux-$linuxVersion/drivers/net/ethernet/intel/igb
#删除驱动缓存和旧的内核文件
##rm -rf dl/linux-$linuxVersion.tar.xz && rm -rf tmp/igb-$igbVersion
#再次进入临时目录并打包内核
##cd tmp && tar -Jcf ../dl/linux-$linuxVersion.tar.xz linux-$linuxVersion --remove-files && cd ..
#获取新打包内核哈希并更新至文件
##linuxHashAll=$(sha256sum dl/linux-$linuxVersion.tar.xz)
##linuxHash=${linuxHashALL:0:65}
#sed -i 's/[a-zA-Z0-9]{65}/$linuxHash/g' include/kernel-$majorVersion
