#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate


sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
sed -i 's/default 448/default 8000/g' config/Config-images.in
sed -i 's/autosamba //g' target/linux/x86/Makefile
#sed -i 's/6\.6/5\.15/g' target/linux/x86/Makefile

sed -n 's/^PKG_VERSION:=//p' feeds/passwall/luci-app-passwall/Makefile | xargs -I {} sed -i "s/DIYVERSION/{}/g" feeds/diy/changen/passwallMakefile
sed -n 's/^PKG_RELEASE:=//p' feeds/passwall/luci-app-passwall/Makefile | xargs -I {} sed -i "s/DIYRELEASE/{}/g" feeds/diy/changen/passwallMakefile
cp -f feeds/diy/changen/passwallMakefile feeds/passwall/luci-app-passwall/Makefile

cp -f feeds/diy/changen/targetmk include/target.mk
cp -f feeds/diy/changen/index.htm package/lean/autocore/files/x86/index.htm
