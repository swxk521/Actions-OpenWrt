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
sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate
sed -i 's/default 160/default 2000/g' config/Config-images.in

sed -n 's/^PKG_VERSION:=//p' package/passwall2/luci-app-passwall2/Makefile | xargs -I {} sed -i "s/DIYVERSION/{}/g" package/diy/changen/passwallMakefile
sed -n 's/^PKG_RELEASE:=//p' package/passwall2/luci-app-passwall2/Makefile | xargs -I {} sed -i "s/DIYRELEASE/{}/g" package/diy/changen/passwallMakefile
cp -f package/diy/changen/passwallMakefile package/passwall2/luci-app-passwall2/Makefile
cp -f package/diy/changen/X86Makefile target/linux/x86/Makefile

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 26.x feeds/packages/lang/golang
