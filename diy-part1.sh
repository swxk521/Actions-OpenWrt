#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default


echo 'src-git diy https://github.com/swxk521/diy' >>feeds.conf.default
echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2' >>feeds.conf.default
echo 'src-git passwallpackages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default

cd ..
git clone https://github.com/kiddin9/openwrt-packages packages
cp -rf packages/luci-app-kcptun openwrt/package/lean/luci-app-kcptun
cp -rf packages/luci-app-udp2raw openwrt/package/lean/luci-app-udp2raw
cp -rf packages/luci-app-speederv2 openwrt/package/lean/luci-app-speederv2
rm -rf packages

