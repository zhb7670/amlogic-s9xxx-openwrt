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
git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld


# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}

