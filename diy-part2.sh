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


sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/luci/bin/config_generate
sed -i 's/default 448/default 2000/g' config/Config-images.in
sed -i 's/autosamba //g' target/linux/x86/Makefile
sed -i 's/automount //g' target/linux/x86/Makefile
# sed -i 's/6.12/6.6/g' target/linux/x86/Makefile
sed -i 's/config_foreach chk_en samba4/config_foreach chk_en samba/g' feeds/packages/net/samba4/files/smb.auto

sed -n 's/^PKG_VERSION:=//p' feeds/passwall2/luci-app-passwall2/Makefile | xargs -I {} sed -i "s/DIYVERSION/{}/g" feeds/diy/changen/passwallMakefile
sed -n 's/^PKG_RELEASE:=//p' feeds/passwall2/luci-app-passwall2/Makefile | xargs -I {} sed -i "s/DIYRELEASE/{}/g" feeds/diy/changen/passwallMakefile
cp -f feeds/diy/changen/passwallMakefile feeds/passwall2/luci-app-passwall2/Makefile

cp -f feeds/diy/changen/99-sysctl.conf package/base-files/files/etc/sysctl.d/99-sysctl.conf
sed -i '/sysctl/d' feeds/packages/net/nlbwmon/Makefile
cp -f feeds/diy/changen/dnsmasq.init package/network/services/dnsmasq/files/dnsmasq.init
cp -f feeds/diy/changen/haproxymakefile feeds/packages/net/haproxy/Makefile
cp -f feeds/diy/changen/targetmk include/target.mk
cp -f feeds/diy/changen/index.htm package/lean/autocore/files/x86/index.htm

sed -i 's/PATCH:=5/PATCH:=6/g' feeds/packages/lang/golang/golang/Makefile
sed -i 's/22a5fd0a91efcd28a1b0537106b9959b2804b61f59c3758b51e8e5429c1a954f/58cbf771e44d76de6f56d19e33b77d745a1e489340922875e46585b975c2b059/g' feeds/packages/lang/golang/golang/Makefile
