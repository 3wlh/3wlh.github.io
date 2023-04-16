#!/bin/sh /etc/rc.common
START=99
STOP=15

start() {
  echo start
  while :
	do
	ping -c 1 raw.iqiq.io > /dev/null 2>&1
		if [ $? -eq 0 ];then
			echo 检测网络正常
			#启动的命令
			wget -O - https://raw.iqiq.io/3wking/3wking.github.io/main/OpenWrt/openclash.sh | bash
			
			
			break
		else
			echo 检测网络连接异常
		fi
	sleep 5
	done
	#删除自身
	rm -f $0
}

stop() {
  echo stop
  #终止应的命令
}