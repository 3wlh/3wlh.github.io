#!/bin/sh
img="https://raw.iqiq.io/3wking/3wking.github.io/main/OpenWrt/IMG/Yamato_Kancolle.mp4"
install() {
echo "下载 argon_img 图片......" 
rm -f /www/luci-static/argon/background/* && wget -q --show-progress "${img}" -O /www/luci-static/argon/background/Yamato_Kancolle.mp4
}
(cd && {
	echo "安装 argon_img 图片" && install && echo "安装 argon_img 图片完成"
})