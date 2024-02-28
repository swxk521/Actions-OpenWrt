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
sed -i 's/100/200/g' feeds/luci/applications/luci-app-vlmcsd/luasrc/controller/vlmcsd.lua

sed -i 's/0.53.2/0.54.0/g' feeds/packages/net/frp/Makefile
sed -i 's/ff2a4f04e7732bc77730304e48f97fdd062be2b142ae34c518ab9b9d7a3b32ec/c09d8610b5eb02c0b1851459ace7751fe80a06b2373a6d5d40631a08e8ac64ae/g' feeds/packages/net/frp/Makefile
sed -i 's/20210116.0/20230206.0/g' feeds/packages/net/udpspeeder/Makefile
sed -i 's/657ae24dfd592a1f6f114342231b24d09baec712957969f425477b9f9fd5994a/c6b0c45e971360b25cd49be0369e94b2fb12f649d39c7e60c172c14a9e3a4e0d/g' feeds/packages/net/udpspeeder/Makefile
sed -i 's/20230207/20240107/g' feeds/packages/net/kcptun/Makefile
sed -i 's/09054b52d5799a8e47edb36f2db335d929d5bbb63a26f7ba2fe03c64ec39d550/4a21033a3558fc9089303505457eead5366af961a7cd56f1856e54ef4d65a1e7/g' feeds/packages/net/kcptun/Makefile

cp -f feeds/diy/changen/targetmk include/target.mk
cp -f feeds/diy/changen/targetMakefile target/linux/x86/Makefile
cp -f feeds/diy/changen/softethervpn feeds/luci/applications/luci-app-softethervpn/root/usr/share/softethervpn/firewall.include
rm -rf feeds/luci/applications/luci-app-wrtbwmon
cp -rf feeds/diy/luci-app-wrtbwmon feeds/luci/applications/luci-app-wrtbwmon

sed -n 's/^PKG_VERSION:=//p' feeds/passwall2/luci-app-passwall2/Makefile | xargs -I {} sed -i "s/DIYVERSION/{}/g" feeds/diy/changen/passwallMakefile
cp -f feeds/diy/changen/passwallMakefile feeds/passwall2/luci-app-passwall2/Makefile

cp -f feeds/diy/changen/v2ray-geodata feeds/passwallpackages/v2ray-geodata/Makefile
cp -f feeds/diy/changen/v2ray-geodata feeds/packages/net/v2ray-geodata/Makefile

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
