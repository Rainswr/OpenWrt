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

wget -O target/linux/x86/patches-5.4/785-igb.5.8.5.patch https://raw.githubusercontent.com/Rainswr/i350/master/patch/5.4/785-igb-5.8.5.patch
