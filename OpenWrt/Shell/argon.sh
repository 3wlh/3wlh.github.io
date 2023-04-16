#!/bin/sh
argon="https://raw.iqiq.io/3wking/3wking.github.io/main/OpenWrt/luci-theme/argon/luci-theme-argon_2.2.9-20211016-1_all.ipk"
argon_config="https://raw.iqiq.io/3wking/3wking.github.io/main/OpenWrt/luci-theme/argon/luci-app-argon-config_0.9-20210309_all.ipk"
install() {
echo "下载 argon ......" 
wget -q --show-progress "${argon}" -O /tmp/luci-theme-argon.ipk && opkg install luci-theme-argon.ipk && rm -f /tmp/luci-theme-argon.ipk && echo "安装 argon 完成"
echo "下载 argon_config ......" 
wget -q --show-progress "${argon_config}" -O /tmp/luci-app-argon-config.ipk && opkg install luci-app-argon-config.ipk && rm -f /tmp/luci-app-argon-config.ipk && echo "安装 argon_config 完成"
}
(cd && {
	echo "安装 argon 主题" && install && echo "安装 argon 完成"
})