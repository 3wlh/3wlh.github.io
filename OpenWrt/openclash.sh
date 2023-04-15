#!/bin/bash
PATH="/etc/openclash/core/"
DEV="https://raw.iqiq.io/vernesong/OpenClash/core/master/dev/clash-linux-arm64.tar.gz"
META="https://raw.iqiq.io/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz"
install{
echo "内核安装中......"
	if [ ! -d ${PATH} ]; then
		mkdir ${PATH} && chmod 0755 ${PATH}
	fi
echo "安装 DEV 内核......" 
wget ${DEV} -O /tmp/dev.tar.gz && tar -zxf /tmp/dev.tar.gz -O > ${PATH}/clash && chmod 0755 ${PATH}/clash && rm -f /tmp/dev*.gz
echo "安装 meta 内核......" 
wget ${METE} -O /tmp/meta.tar.gz && tar -zxf /tmp/meta.tar.gz  -O > ${PATH}/clash_meta && chmod 0755 ${PATH}/clash_meta && rm -f /tmp/meta*.gz
echo "内核安装完成"
}
install