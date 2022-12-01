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


init_Clash() {
cat >$Clash<<EOF

config openclash 'config'
	option proxy_port '7892'
	option tproxy_port '7895'
	option mixed_port '7893'
	option socks_port '7891'
	option http_port '7890'
	option dns_port '7874'
	option update '0'
	option cn_port '9090'
	option dashboard_password '123456'
	option dashboard_forward_ssl '0'
	option rule_source '0'
	option enable_custom_dns '0'
	option ipv6_enable '0'
	option ipv6_dns '0'
	option enable_custom_clash_rules '0'
	option other_rule_auto_update '0'
	option en_mode 'redir-host'
	option enable_redirect_dns '1'
	option dns_advanced_setting '0'
	option servers_if_update '0'
	option disable_masq_cache '0'
	option servers_update '0'
	option log_level 'silent'
	option proxy_mode 'rule'
	option intranet_allowed '1'
	option disable_udp_quic '1'
	option lan_ac_mode '0'
	option operation_mode 'redir-host'
	option cachesize_dns '0'
	option filter_aaaa_dns '0'
	option small_flash_memory '0'
	option interface_name '0'
	option log_size '1024'
	option tolerance '0'
	option store_fakeip '1'
	option custom_fallback_filter '0'
	option append_wan_dns '1'
	option stream_domains_prefetch '0'
	option stream_auto_select '0'
	option dns_remote '1'
	option bypass_gateway_compatible '0'
	option github_address_mod '0'
	option delay_start '0'
	option router_self_proxy '1'
	option release_branch 'master'
	option enable_meta_core '0'
	option dashboard_type 'Official'
	option yacd_type 'Official'
	option append_default_dns '1'
	option geo_custom_url 'https://testingcf.jsdelivr.net/gh/alecthw/mmdb_china_ip_list@release/lite/Country.mmdb'
	option chnr_custom_url 'https://ispip.clang.cn/all_cn.txt'
	option chnr6_custom_url 'https://ispip.clang.cn/all_cn_ipv6.txt'
	option cndomain_custom_url 'https://testingcf.jsdelivr.net/gh/felixonmars/dnsmasq-china-list@master/accelerated-domains.china.conf'
	option core_version 'linux-arm64'
	option default_resolvfile '/tmp/resolv.conf.d/resolv.conf.auto'
	option auto_update '1'
	option config_auto_update_mode '0'
	option config_update_week_time '*'
	option auto_update_time '2'
	option config_path '/etc/openclash/config/木瓜云.yaml'
	option restricted_mode '0'
	option enable_rule_proxy '1'
	option common_ports '1'
	option china_ip_route '1'
	option other_rule_update_week_time '1'
	option other_rule_update_day_time '0'
	option geo_auto_update '0'
	option geo_update_week_time '1'
	option geo_update_day_time '0'
	option chnr_auto_update '0'
	option chnr_update_week_time '1'
	option chnr_update_day_time '0'
	option auto_restart '0'
	option auto_restart_week_time '1'
	option auto_restart_day_time '0'
	option enable '1'
	option dnsmasq_noresolv '0'
	option dnsmasq_resolvfile '/tmp/resolv.conf.d/resolv.conf.auto'
	option redirect_dns '1'
	list wan_ac_black_ips '10.10.10.150'
	list wan_ac_black_ips '10.10.10.160'
	list wan_ac_black_ips '10.10.10.252'
	option enable_udp_proxy '0'
	option config_reload '1'

config dns_servers
	option group 'nameserver'
	option type 'udp'
	option ip '114.114.114.114'
	option enabled '1'

config dns_servers
	option group 'nameserver'
	option type 'udp'
	option ip '119.29.29.29'
	option enabled '1'

config dns_servers
	option group 'nameserver'
	option type 'udp'
	option ip '119.28.28.28'
	option enabled '0'

config dns_servers
	option group 'nameserver'
	option type 'udp'
	option ip '223.5.5.5'
	option enabled '0'

config dns_servers
	option type 'https'
	option ip 'doh.pub/dns-query'
	option group 'nameserver'
	option enabled '1'

config dns_servers
	option type 'https'
	option ip 'dns.alidns.com/dns-query'
	option group 'nameserver'
	option enabled '1'

config dns_servers
	option type 'https'
	option group 'fallback'
	option ip 'dns.cloudflare.com/dns-query'
	option enabled '1'

config dns_servers
	option group 'fallback'
	option ip 'dns.google'
	option port '853'
	option type 'tls'
	option enabled '0'

config dns_servers
	option group 'fallback'
	option type 'https'
	option ip '1.1.1.1/dns-query'
	option enabled '0'

config dns_servers
	option group 'fallback'
	option ip '1.1.1.1'
	option port '853'
	option type 'tls'
	option enabled '0'

config dns_servers
	option enabled '0'
	option group 'fallback'
	option ip '8.8.8.8'
	option port '853'
	option type 'tls'

config dns_servers
	option type 'udp'
	option group 'fallback'
	option ip '2001:4860:4860::8888'
	option port '53'
	option enabled '0'

config dns_servers
	option type 'udp'
	option group 'fallback'
	option ip '2001:4860:4860::8844'
	option port '53'
	option enabled '0'

config dns_servers
	option type 'udp'
	option group 'fallback'
	option ip '2001:da8::666'
	option port '53'
	option enabled '0'

config dns_servers
	option group 'fallback'
	option type 'https'
	option ip 'public.dns.iij.jp/dns-query'
	option enabled '1'

config dns_servers
	option group 'fallback'
	option type 'https'
	option ip 'jp.tiar.app/dns-query'
	option enabled '1'

config dns_servers
	option group 'fallback'
	option type 'https'
	option ip 'jp.tiarap.org/dns-query'
	option enabled '1'

config dns_servers
	option group 'fallback'
	option ip 'jp.tiar.app'
	option type 'tls'
	option enabled '0'

config dns_servers
	option group 'fallback'
	option ip 'dot.tiar.app'
	option type 'tls'
	option enabled '1'

config authentication
	option enabled '1'
	option username 'Clash'
	option password 'M0gI64rw'

config config_subscribe
	option enabled '1'
	option name '木瓜云'
	option address 'https://v2.mugua-sub.com/link/DJ8FMih4AiYLEQXc?clash=1&dns=0'
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

#========入口========

(cd $config && {
    [ -a ddns ] && init_DDNS && echo "DDNS......OK"
    [ -a argon ] && init_ARGON && echo "ARGON......OK"
    [ -a v2ray_server ] && init_V2ray && echo "V2ray......OK"
    [ -a ipsec ] && init_IPSEC && echo "IPSEC......OK"
    [ -a pptpd ] && init_PPTP && echo "PPTP......OK"
    [ -a openclash ] && init_Clash && echo "openclash......OK"
    [ -a network ] && init_Network && echo "Network......OK"
    [ -a firewall ] && init_Firewall && echo "Firewall......OK"
    echo
    echo '================================='
    echo '==========配置完成================'
    echo '================================='
})
