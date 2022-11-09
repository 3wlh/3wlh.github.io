#!/bin/bash
DDNS="/etc/ddns"
ARGON="/etc/argon"
IPSEC="/etc/ipsec"
PPTP="/etc/pptpd"
V2ray="/etc/v2ray_server"

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

cat >$ARGON<<EOF

config global
	option mode 'normal'
	option bing_background '0'
	option transparency_dark '0'
	option dark_primary '#e16496'
	option primary '#e16496'
	option blur_dark '1'
	option transparency '0'
	option save '淇濆瓨鏇存敼'
	option blur '1'
EOF

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
