#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

sed -i 's/192.168.1.1/10.10.10.11/g' package/base-files/files/bin/config_generate
sed -i 's/192.168/10.10/g' package/base-files/files/bin/config_generate
sed -i 's/).1/).10/g' package/base-files/files/bin/config_generate

# 修改 argon 为默认主题
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#wget -P dll https://github.com/Rainswr/i350/releases/download/v1.0.0/linux-5.11.16.tar.xz
#sed -i 's/21163681d130cbce5a6be39019e2c69e44f284855ddd70b1a3bd039249540f43/0fefbe94e68b0ce15094b5f81761ad8252e9920c3cf3877b929576f72b7ca48e/g' package/network/utils/bpftools/Makefile

#更改内核
#sed -i 's/5.10/5.4/g' target/linux/x86/Makefile

#smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
