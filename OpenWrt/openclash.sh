#!/bin/sh
PATH="/etc/openclash/core/"
DEV="https://raw.iqiq.io/vernesong/OpenClash/core/master/dev/clash-linux-arm64.tar.gz"
META="https://raw.iqiq.io/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz"
echo "内核安装中......"
	if [ ! -d ${PATH} ]; then
		mkdir ${PATH} && chmod 0755 ${PATH}
	fi
echo "安装 dev 内核......" 
/usr/bin/wget "${DEV}" -O /tmp/dev.tar.gz && tar -zxf /tmp/dev.tar.gz -O > ${PATH}/clash && chmod 0755 ${PATH}/clash && rm -f /tmp/dev*.gz && echo "dev 内核安装完成"
echo "安装 meta 内核......" 
/usr/bin/wget "${METE}" -O /tmp/meta.tar.gz && tar -zxf /tmp/meta.tar.gz  -O > ${PATH}/clash_meta && chmod 0755 ${PATH}/clash_meta && rm -f /tmp/meta*.gz && echo "meta 内核安装完成"