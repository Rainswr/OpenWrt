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

#更改内核
sed -i 's/5.10/5.4/g' target/linux/x86/Makefile

#igb-intel
sed -i 's/@PCI_SUPPORT +kmod-i2c-core/@LINUX_5_15 @PCI_SUPPORT +kmod-i2c-core/g' package/kernel/linux/modules/netdevices.mk
sed -i 's/kmod-igb/kmod-igb kmod-igb-intel/g' target/linux/x86/Makefile
#sed -i 's/kmod-igb/kmod-igb-intel/g' target/linux/x86/image/64.mk
