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

sed -i 's/default "0"/default "3"/g' config/Config-images.in
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
sed -i 's/default 448/default 2000/g' config/Config-images.in
sed -i 's/autosamba //g' target/linux/x86/Makefile
sed -i 's/6\.6/6\.1/g' target/linux/x86/Makefile

sed -n 's/^PKG_VERSION:=//p' feeds/passwall2/luci-app-passwall2/Makefile | xargs -I {} sed -i "s/DIYVERSION/{}/g" feeds/diy/changen/passwallMakefile
cp -f feeds/diy/changen/passwallMakefile feeds/passwall2/luci-app-passwall2/Makefile

sed -i 's/20230207/20241119/g' feeds/packages/net/kcptun/Makefile
sed -i 's/09054b52d5799a8e47edb36f2db335d929d5bbb63a26f7ba2fe03c64ec39d550/a591b539e6a0d2a3b652fa5825fc81b4c3b087412d8692403b0b831fd11014b2/g' feeds/packages/net/kcptun/Makefile

sed -i 's/0.51.3/0.61.1/g' feeds/packages/net/frp/Makefile
sed -i 's/83032399773901348c660d41c967530e794ab58172ccd070db89d5e50d915fef/95c567188d5635a7ac8897a6f93ae0568d0ac4892581a96c89874a992dd6a73c/g' feeds/packages/net/frp/Makefile
sed -i 's/full.ini/full_example.toml/g' feeds/packages/net/frp/Makefile
echo -n "" > feeds/packages/net/frp/files/frpc.init
echo -n "" > feeds/packages/net/frp/files/frps.init

cp -f feeds/diy/changen/targetmk include/target.mk
cp -f feeds/diy/changen/index.htm package/lean/autocore/files/x86/index.htm
cp -f feeds/diy/changen/nginx.config feeds/packages/net/nginx-util/files/nginx.config

