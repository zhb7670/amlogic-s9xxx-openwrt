#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# PassWall 依赖包 - 必须在 feeds update 前克隆
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages package/passwall-packages
# ↓ 新增内容 ↓
# ssr-plus 依赖包 - helloworld 源
# git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
# MosDNS v5 - DNS 分流器
rm -rf feeds/packages/net/v2ray-geodata
git clone --depth=1 https://github.com/sbwml/luci-app-mosdns package/mosdns
git clone --depth=1 https://github.com/sbwml/v2ray-geodata package/v2ray-geodata



# luci-app-verysync - 微力同步Web界面
cp -r ${GITHUB_WORKSPACE}/luci-app-verysync package/luci-app-verysync

# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}

