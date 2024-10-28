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

sed -i 's/default "0"/default "5"/g' config/Config-images.in
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
sed -i 's/default 448/default 2000/g' config/Config-images.in
sed -i 's/automount //g' target/linux/x86/Makefile
sed -i 's/autosamba //g' target/linux/x86/Makefile

sed -n 's/^PKG_VERSION:=//p' feeds/passwall2/luci-app-passwall2/Makefile | xargs -I {} sed -i "s/DIYVERSION/{}/g" feeds/diy/changen/passwallMakefile
cp -f feeds/diy/changen/passwallMakefile feeds/passwall2/luci-app-passwall2/Makefile

cp -f feeds/diy/changen/targetmk include/target.mk
cp -f feeds/diy/changen/index.htm package/lean/autocore/files/x86/index.htm
cp -f feeds/diy/changen/v2ray-geodata feeds/passwallpackages/v2ray-geodata/Makefile
cp -f feeds/diy/changen/v2ray-geodata feeds/packages/net/v2ray-geodata/Makefile
cp -f feeds/diy/changen/nginx.config feeds/packages/net/nginx-util/files/nginx.config

rm -rf feeds/packages/net/frp
cp -rf feeds/diy/frp feeds/packages/net/frp
rm -rf feeds/packages/net/udpspeeder
cp -rf feeds/diy/udpspeeder feeds/packages/net/udpspeeder
rm -rf feeds/packages/net/kcptun
cp -rf feeds/diy/kcptun feeds/packages/net/kcptun
rm -rf feeds/packages/net/sing-box
cp -rf feeds/passwallpackages/sing-box feeds/packages/net/sing-box
rm -rf feeds/packages/net/xray-core
cp -rf feeds/passwallpackages/xray-core feeds/packages/net/xray-core
rm -rf feeds/packages/net/lucky
cp -rf feeds/luciapplucky/lucky feeds/packages/net/lucky
