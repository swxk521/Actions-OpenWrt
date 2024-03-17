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
sed -i 's/default 400/default 1000/g' config/Config-images.in

sed -i 's/0.53.2/0.55.1/g' feeds/packages/net/frp/Makefile
sed -i 's/ff2a4f04e7732bc77730304e48f97fdd062be2b142ae34c518ab9b9d7a3b32ec/c655fdf679aa94ec9abefc625b79bfb12aecf36011e23c207e322a0748c6c693/g' feeds/packages/net/frp/Makefile

cp -f feeds/diy/changen/targetmk include/target.mk
cp -f feeds/diy/changen/targetMakefile target/linux/x86/Makefile
cp -f feeds/diy/changen/softethervpn feeds/luci/applications/luci-app-softethervpn/root/usr/share/softethervpn/firewall.include
rm -rf feeds/luci/applications/luci-app-wrtbwmon
cp -rf feeds/diy/luci-app-wrtbwmon feeds/luci/applications/luci-app-wrtbwmon
rm -rf feeds/packages/net/udpspeeder
cp -rf feeds/diy/udpspeeder feeds/packages/net/udpspeeder
rm -rf feeds/packages/net/kcptun
cp -rf feeds/diy/kcptun feeds/packages/net/kcptun

sed -n 's/^PKG_VERSION:=//p' feeds/passwall2/luci-app-passwall2/Makefile | xargs -I {} sed -i "s/DIYVERSION/{}/g" feeds/diy/changen/passwallMakefile
cp -f feeds/diy/changen/passwallMakefile feeds/passwall2/luci-app-passwall2/Makefile

cp -f feeds/diy/changen/v2ray-geodata feeds/passwallpackages/v2ray-geodata/Makefile
cp -f feeds/diy/changen/v2ray-geodata feeds/packages/net/v2ray-geodata/Makefile

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
