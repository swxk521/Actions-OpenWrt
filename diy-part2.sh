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

sed -i 's/0.53.2/0.59.0/g' feeds/packages/net/frp/Makefile
sed -i 's/ff2a4f04e7732bc77730304e48f97fdd062be2b142ae34c518ab9b9d7a3b32ec/eb4848119a9684b7762171d7633aa5ee29d195e63f53e89e7b549096bdf4a5a9/g' feeds/packages/net/frp/Makefile

cp -f feeds/diy/changen/targetmk include/target.mk
cp -f feeds/diy/changen/targetMakefile target/linux/x86/Makefile
rm -rf feeds/packages/net/udpspeeder
cp -rf feeds/diy/udpspeeder feeds/packages/net/udpspeeder
rm -rf feeds/packages/net/kcptun
cp -rf feeds/diy/kcptun feeds/packages/net/kcptun

sed -n 's/^PKG_VERSION:=//p' feeds/passwall2/luci-app-passwall2/Makefile | xargs -I {} sed -i "s/DIYVERSION/{}/g" feeds/diy/changen/passwallMakefile
cp -f feeds/diy/changen/passwallMakefile feeds/passwall2/luci-app-passwall2/Makefile

cp -f feeds/diy/changen/v2ray-geodata feeds/passwallpackages/v2ray-geodata/Makefile
cp -f feeds/diy/changen/v2ray-geodata feeds/packages/net/v2ray-geodata/Makefile
cp -f feeds/diy/changen/luci_socat feeds/luci/applications/luci-app-socat/root/etc/init.d/luci_socat
cp -f feeds/diy/changen/index.htm package/lean/autocore/files/x86/index.htm
cp -f feeds/diy/changen/bandwidthd feeds/packages/utils/bandwidthd/files/bandwidthd.config
cp -f feeds/diy/changen/nginx.config feeds/packages/net/nginx-util/files/nginx.config
