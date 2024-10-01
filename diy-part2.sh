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

sed -i 's/0.53.2/0.60.0/g' feeds/packages/net/frp/Makefile
sed -i 's/ff2a4f04e7732bc77730304e48f97fdd062be2b142ae34c518ab9b9d7a3b32ec/8feaf56fc3f583a51a59afcab1676f4ccd39c1d16ece08d849f8dc5c1e5bff55/g' feeds/packages/net/frp/Makefile

cp -f feeds/diy/changen/targetmk include/target.mk
rm -rf feeds/packages/net/udpspeeder
cp -rf feeds/diy/udpspeeder feeds/packages/net/udpspeeder
rm -rf feeds/packages/net/kcptun
cp -rf feeds/diy/kcptun feeds/packages/net/kcptun
rm -rf feeds/luci/applications/luci-app-wrtbwmon
cp -rf feeds/diy/luci-app-wrtbwmon feeds/luci/applications/luci-app-wrtbwmon

sed -n 's/^PKG_VERSION:=//p' feeds/passwall2/luci-app-passwall2/Makefile | xargs -I {} sed -i "s/DIYVERSION/{}/g" feeds/diy/changen/passwallMakefile
cp -f feeds/diy/changen/passwallMakefile feeds/passwall2/luci-app-passwall2/Makefile

cp -f feeds/diy/changen/v2ray-geodata feeds/passwallpackages/v2ray-geodata/Makefile
cp -f feeds/diy/changen/v2ray-geodata feeds/packages/net/v2ray-geodata/Makefile
cp -f feeds/diy/changen/socat feeds/packages/net/socat/Makefile
cp -f feeds/diy/changen/luci_socat feeds/luci/applications/luci-app-socat/root/etc/init.d/luci_socat
cp -f feeds/diy/changen/nginx.config feeds/packages/net/nginx-util/files/nginx.config
