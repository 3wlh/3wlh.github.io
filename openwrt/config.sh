#!/bin/bash
#========变量========

config="/etc/config"
DDNS="/etc/config/ddns"
ARGON="/etc/config/argon"
V2ray="/etc/config/v2ray_server"
IPSEC="/etc/config/ipsec"
PPTP="/etc/config/pptpd"
Firewall="/etc/config/firewall"

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
config user '83d6d883d91c4242bd28d35e2ede7606'
	option enable '1'
	option remarks 'HOME'
	option port '4333'
	list uuid '8F7720C3-9378-1732-0656-6BD642DC0315'
	option tls '0'
	option transport 'tcp'
	option tcp_guise 'none'
	option level '4'
	option protocol 'vless'
	option decryption 'none'
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
	option src_dport '4333'
	option dest_ip '10.10.10.254'
	option dest_port '4333'

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
	option name 'NAS_455'
	option src 'wan'
	option src_dport '4455'
	option dest_ip '10.10.10.252'
	option dest_port '455'
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
	option name 'NAS_8866'
	option src 'wan'
	option src_dport '8866'
	option dest_ip '10.10.10.252'
	option dest_port '8866'
config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'NAS_8181'
	option src 'wan'
	option src_dport '8181'
	option dest_ip '10.10.10.252'
	option dest_port '8181'

config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'NAS_12580'
	option src 'wan'
	option src_dport '12580'
	option dest_ip '10.10.10.252'
	option dest_port '12580'
	
config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'PVE'
	option src 'wan'
	option src_dport '8006'
	option dest_ip '10.10.10.251'
	option dest_port '8006'

config redirect
	option dest 'lan'
	option target 'DNAT'
	option name 'MQTT'
	option src 'wan'
	option src_dport '183'
	option dest_ip '10.10.10.6'
	option dest_port '80'

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

#========入口========

(cd $config && {
    [ -a ddns ] && init_DDNS && echo "DDNS......OK"
    [ -a argon ] && init_ARGON && echo "ARGON......OK"
    [ -a v2ray_server ] && init_V2ray && echo "V2ray......OK"
    [ -a ipsec ] && init_IPSEC && echo "IPSEC......OK"
    [ -a pptpd ] && init_PPTP && echo "PPTP......OK"
    #[ -a firewall ] && init_Firewall && echo "Firewall......OK"
    echo
    echo
    echo '================================='
    echo '==========配置完成================'
    echo '================================='
})
