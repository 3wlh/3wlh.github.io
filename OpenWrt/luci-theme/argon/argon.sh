#!/bin/sh
argon=" https://raw.iqiq.io/3wking/3wking.github.io/main/OpenWrt/luci-theme/argon/luci-theme-argon_2.2.9-20211016-1_all.ipk"
argon_config="https://raw.iqiq.io/3wking/3wking.github.io/main/OpenWrt/luci-theme/argon/luci-app-argon-config_0.9-20210309_all.ipk"
echo "安装 argon ......" 
wget -P /tmp ${argon} && opkg install luci-theme-argon*.ipk && rm -f /tmp/luci-theme-argon*.ipk
echo "安装 argon_config ......" 
wget -P /tmp ${argon_config} && opkg install luci-app-argon-config*.ipk && rm -f /tmp/luci-app-argon-config*.ipk
}
echo "argon 安装中 ......" && install && echo "argon 安装完成"