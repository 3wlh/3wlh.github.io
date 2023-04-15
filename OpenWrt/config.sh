#!/bin/bash
#========变量========
config="/etc/config"
DDNS="/etc/config/ddns"
ARGON="/etc/config/argon"
V2ray="/etc/config/v2ray_server"
IPSEC="/etc/config/ipsec"
PPTP="/etc/config/pptpd"
Clash="/etc/config/openclash"
Network="/etc/config/network"
Firewall="/etc/config/firewall"
LED="/etc/config/system"

#========函数========

init_DDNS() {
cat >$DDNS<<EOF

config ddns 'global'
	option ddns_dateformat '%F %R'
	option ddns_loglines '250'
	option ddns_rundir '/var/run/ddns'
	option ddns_logdir '/var/log/ddns'

config service '3wking'
	option service_name 'aliyun.com'
	option use_ipv6 '0'
	option enabled '1'
	option lookup_host '3wking.com'
	option domain '@.3wking.com'
	option username 'LTAITH5SfzDHXM9T'
	option password 'ZdLWBCDBExC5gKnS4L4cCZpiT9Z7dm'
	option ip_source 'network'
	option ip_network 'wan'
	option interface 'wan'
	option use_syslog '2'
	option check_unit 'minutes'
	option force_unit 'minutes'
	option retry_unit 'seconds'
	option check_interval '5'
EOF
}

init_ARGON() {
cat >$ARGON<<EOF

config global
	option mode 'normal'
	option bing_background '0'
	option transparency_dark '0'
	option dark_primary '#e16496'
	option primary '#e16496'
	option blur_dark '1'
	option transparency '0'
	option blur '1'
	option save '保存更改'
EOF
}

init_V2ray() {
cat >$V2ray<<EOF

config global
	option enable '1'

config user '293af8e569f3446d92ff5cd9ce332ba8'
	option enable '1'
	option remarks 'Home_VLESS'
	option protocol 'vless'
	option port '4333'
	option decryption 'none'
	list uuid '19970101-1997-0101-4333-1094890624ff'
	option level '1'
	option tls '0'
	option transport 'tcp'
	option tcp_guise 'none'
	option accept_lan '1'

config user 'ed6e87dd84844c9d9881872a1c660725'
	option enable '1'
	option remarks 'Home_VMESS'
	option protocol 'vmess'
	option port '4334'
	list uuid '19970101-1997-0101-4334-1094890624ff'
	option alter_id '16'
	option level '1'
	option tls '0'
	option transport 'tcp'
	option tcp_guise 'none'
	option accept_lan '1'

config user 'f70129045dee489793b400ddd7af5687'
	option enable '1'
	option remarks 'Home_Socks'
	option protocol 'socks'
	option port '4335'
	option auth '1'
	option username '3wking'
	option password 'qq1094890624'
	option tls '0'
	option transport 'tcp'
	option tcp_guise 'none'
	option accept_lan '1'

EOF
}

init_IPSEC() {
cat >$IPSEC<<EOF

config service 'ipsec'
	option enabled '1'
	option clientdns '10.10.10.254'
	option account '3wking'
	option password 'lh199711'
	option secret '1094890624'
	option clientip '10.0.0.1/24'
	
config users
	option enabled '1'
	option username '3wking'
	option password 'lh199711'
EOF
}

init_PPTP() {
cat >$PPTP<<EOF

config service 'pptpd'
	option logwtmp '0'
	option localip '10.10.10.254'
	option remoteip '10.10.10.11-19'
	option remotedns '10.10.10.254'
	option enabled '1'
	
config login 'login'
	option username '3wking'
	option password 'lh199711'
EOF
}


init_Clash() {
if ! grep -q "config openclash 'config'" $Clash; then
	sed -i "1a\config openclash 'config'" $Clash
	fi
#不走代理
if ! grep -q "10.10.10.252" $Clash; then
	sed -i "/config openclash 'config'/a\	list lan_ac_black_ips '10.10.10.252'" $Clash
	fi
if ! grep -q "10.10.10.160" $ClashS; then
	sed -i "/config openclash 'config'/a\	list lan_ac_black_ips '10.10.10.160'" $Clash
	fi	
if ! grep -q "10.10.10.150" $Clash; then
	sed -i "/config openclash 'config'/a\	list lan_ac_black_ips '10.10.10.150'" $Clash
	fi
#更新订阅
if ! grep -q "^.*option auto_update '[0-9]'" $Clash; then
	sed -i "/config openclash 'config'/a\	option auto_update '1'" $Clash
	sed -i "/config openclash 'config'/a\	option config_auto_update_mode '0'" $Clash
	sed -i "/config openclash 'config'/a\	option config_update_week_time '*'" $Clash
	sed -i "/config openclash 'config'/a\	option auto_update_time '2'" $Clash	
else
	sed -i "s|^.*option auto_update '[0-9]'|	option auto_update '1'|g" $Clash
	sed -i "/config openclash 'config'/a\	option config_auto_update_mode '0'" $Clash
	sed -i "/config openclash 'config'/a\	option config_update_week_time '*'" $Clash
	sed -i "/config openclash 'config'/a\	option auto_update_time '2'" $Clash
	fi	
#使用meta内核
if ! grep -q "^.*option enable_meta_core '[0-9]'" $Clash; then
	sed -i "/config openclash 'config'/a\	option enable_meta_core '1'" $Clash
else
	sed -i "s|^.*option enable_meta_core '[0-9]'|	option enable_meta_core '1'|g" $Clash
	fi		
if ! grep -q "^.*option enable_rule_proxy '[0-9]'" $Clash; then
	sed -i "/config openclash 'config'/a\	option enable_rule_proxy '1'" $Clash
else
	sed -i "s|^.*option enable_rule_proxy '[0-9]'|	option enable_rule_proxy '1'|g" $Clash
	fi	
if ! grep -q "^.*option intranet_allowed '[0-9]'" $Clash; then
	sed -i "/config openclash 'config'/a\	option intranet_allowed '1'" $Clash
else
	sed -i "s|^.*option intranet_allowed '[0-9]'|	option intranet_allowed '1'|g" $Clash
	fi
if ! grep -q "option custom_china_domain_dns_server" $Clash; then
	sed -i "/config openclash 'config'/a\	option custom_china_domain_dns_server '114.114.114.114'" $Clash
fi	
if ! grep -q "^.*option china_ip_route '[0-9]'" $Clash; then
	sed -i "/config openclash 'config'/a\	option china_ip_route '1'" $Clash
else
	sed -i "s|^.*option china_ip_route '[0-9]'|	option china_ip_route '1'|g" $Clash
	fi

cat >>$Clash<<EOF

config config_subscribe
	option enabled '1'
	option name 'Clash'
	option address ''
	option sub_convert '0'
	list keyword 'V3'
	list keyword '香港'
	list keyword '台湾'
EOF
}

init_Firewall() {
cat >>$Firewall<<EOF

config redirect
	option dest 'lan'
	option target 'DNAT'
	option name '3wking_web'
	option src 'wan'
	option src_dport '8'
	option dest_ip '10.10.10.254'
	option dest_port '80'

config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'V2rray'
	option src 'wan'
	option src_dport '4333-4335'
	option dest_ip '10.10.10.254'
	option dest_port '4333-4335'

config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'VPN 1723'
	option src 'wan'
	option src_dport '1723'
	option dest_ip '10.10.10.254'
	option dest_port '1723'
	
config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'aDrive'
	option src 'wan'
	option src_dport '8181'
	option dest_ip '10.10.10.254'
	option dest_port '8181'

config redirect
	option dest 'lan'
	option target 'DNAT'
	option src 'wan'
	option src_dport '6'
	option dest_ip '10.10.10.253'
	option dest_port '80'
	option name 'ASUS_WEB'
	
config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'NAS_WEB'
	option src 'wan'
	option src_dport '2'
	option dest_ip '10.10.10.252'
	option dest_port '80'

config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'NAS_445'
	option src 'wan'
	option src_dport '4455'
	option dest_ip '10.10.10.252'
	option dest_port '445'
	
config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'NAS_5000'
	option src 'wan'
	option src_dport '5000'
	option dest_ip '10.10.10.252'
	option dest_port '5000'

config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'NAS_5001'
	option src 'wan'
	option src_dport '5001'
	option dest_ip '10.10.10.252'
	option dest_port '5001'
	
config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'NAS_7000'
	option src 'wan'
	option src_dport '7000'
	option dest_ip '10.10.10.252'
	option dest_port '7000'	
	
config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'VS_Code'
	option src 'wan'
	option src_dport '8081'
	option dest_ip '10.10.10.252'
	option dest_port '8081'

config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'TVBOX'
	option src 'wan'
	option src_dport '882'
	option dest_ip '10.10.10.252'
	option dest_port '882'
EOF
}

init_Network() {
cat >>$Network<<EOF

config interface 'MODE'
	option proto 'static'
	option device 'eth2'
	option ipaddr '192.168.1.1'
	option gateway '192.168.1.10'
	option defaultroute '0'
EOF
}

init_LED() {
cat >>$LED<<EOF

config led
	option sysfs 'sys_led'
	option trigger 'none'
	option name 'SYS_LED'
	option default '0'
EOF
echo ledtrig-netdev > /etc/modules.d/led-for-r6s && ln -s /etc/modules.d/led-for-r6s /etc/modules-boot.d/led-for-r6s && modprobe ledtrig-netdev
}

#========入口========

(cd $config && {
    [ -a ddns ] && init_DDNS && echo "DDNS......OK" &
    sleep 1
    [ -a argon ] && init_ARGON && echo "ARGON......OK" &
    sleep 1
    [ -a v2ray_server ] && init_V2ray && echo "V2ray......OK" &
    sleep 1
    [ -a ipsec ] && init_IPSEC && echo "IPSEC......OK" &
    sleep 1
    [ -a pptpd ] && init_PPTP && echo "PPTP......OK" &
    sleep 1
    [ -a openclash ] && init_Clash && echo "openclash......OK" &
    sleep 1
    [ -a network ] && init_Network && echo "Network......OK" &
    sleep 1
    [ -a firewall ] && init_Firewall && echo "Firewall......OK" &
    sleep 1
    [ -a firewall ] && init_LED && echo "LED......OK" &
    sleep 1
    echo  
    echo '=================================' 
    echo '==========配置完成================' 
    echo '================================='
})
