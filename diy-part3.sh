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

wget -o target/linux/x86/patches-5.10/585-igb.5.8.5.patch https://github.com/Rainswr/i350/releases/download/v1.0.0/585-igb.5.8.5_5.10.patch
