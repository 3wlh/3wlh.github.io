#!/bin/sh
dir="/etc/openclash/core/"
DEV="https://raw.iqiq.io/vernesong/OpenClash/core/master/dev/clash-linux-arm64.tar.gz"
META="https://raw.iqiq.io/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz"
install() {
echo "内核安装中......"
	if [ ! -d ${dir} ]; then
		mkdir ${dir} && chmod 0755 ${dir}
	fi	
echo "下载 dev 内核......"
 wget -q --show-progress "${DEV}" -O /tmp/dev.tar.gz && tar -zxf /tmp/dev*.gz -O > ${dir}/clash && chmod 0755 ${dir}/clash && rm -f /tmp/dev*.gz && echo "dev 内核安装完成"
echo "下载 meta 内核......"
wget -q --show-progress "${META}" -O /tmp/meta.tar.gz && tar -zxf /tmp/meta*.gz  -O > ${dir}/clash_meta && chmod 0755 ${dir}/clash_meta && rm -f /tmp/meta*.gz && echo "meta 内核安装完成"
}
(cd && {
	echo "安装Openclash内核" && install && echo "安装Openclash内核完成"
})