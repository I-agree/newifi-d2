#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone --depth=1 https://github.com/laipeng668/luci-app-gecoosac package/luci-app-gecoosac

# ======================== 【主线内核配置合并注入】 ========================
CONFIG_FILE="target/linux/ramips/mt7621/config-6.18"

echo "📝 正在精准注入内核配置到: $CONFIG_FILE"
cat >> "$CONFIG_FILE" << 'EOF'
# =================================================================
# 🔄 ZRAM 内存压缩
# =================================================================
CONFIG_ZRAM=y

EOF
echo "✅ 内核参数注入完成"
