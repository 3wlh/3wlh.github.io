#!/bin/bash
dir="/etc/opkg/customfeeds.conf"
dir2="/etc/config/luci"
#卸载语言
echo '（1/26）' && opkg remove luci-i18n-base-bg --force-removal-of-dependent-packages --autoremove 
echo '（2/26）' && opkg remove luci-i18n-base-ca --force-removal-of-dependent-packages --autoremove 
echo '（3/26）' && opkg remove luci-i18n-base-cs --force-removal-of-dependent-packages --autoremove 
echo '（4/26）' && opkg remove luci-i18n-base-de --force-removal-of-dependent-packages --autoremove 
echo '（5/26）' && opkg remove luci-i18n-base-el --force-removal-of-dependent-packages --autoremove 
echo '（6/26）' && opkg remove luci-i18n-base-en --force-removal-of-dependent-packages --autoremove 
echo '（7/26）' && opkg remove luci-i18n-base-es --force-removal-of-dependent-packages --autoremove 
echo '（8/26）' && opkg remove luci-i18n-base-fr --force-removal-of-dependent-packages --autoremove 
echo '（9/26）' && opkg remove luci-i18n-base-he --force-removal-of-dependent-packages --autoremove 
echo '（10/26）' && opkg remove luci-i18n-base-hu --force-removal-of-dependent-packages --autoremove 
echo '（11/26）' && opkg remove luci-i18n-base-it --force-removal-of-dependent-packages --autoremove 
echo '（12/26）' && opkg remove luci-i18n-base-ja --force-removal-of-dependent-packages --autoremove 
echo '（13/26）' && opkg remove luci-i18n-base-ko --force-removal-of-dependent-packages --autoremove 
echo '（14/26）' && opkg remove luci-i18n-base-mr --force-removal-of-dependent-packages --autoremove 
echo '（15/26）' && opkg remove luci-i18n-base-ms --force-removal-of-dependent-packages --autoremove 
echo '（16/26）' && opkg remove luci-i18n-base-pl --force-removal-of-dependent-packages --autoremove 
echo '（17/26）' && opkg remove luci-i18n-base-pt --force-removal-of-dependent-packages --autoremove 
echo '（18/26）' && opkg remove luci-i18n-base-pt-br --force-removal-of-dependent-packages --autoremove 
echo '（19/26）' && opkg remove luci-i18n-base-ro --force-removal-of-dependent-packages --autoremove 
echo '（20/26）' && opkg remove luci-i18n-base-ru --force-removal-of-dependent-packages --autoremove 
echo '（21/26）' && opkg remove luci-i18n-base-sk --force-removal-of-dependent-packages --autoremove 
echo '（22/26）' && opkg remove luci-i18n-base-sv --force-removal-of-dependent-packages --autoremove 
echo '（23/26）' && opkg remove luci-i18n-base-tr --force-removal-of-dependent-packages --autoremove 
echo '（24/26）' && opkg remove luci-i18n-base-uk --force-removal-of-dependent-packages --autoremove 
echo '（25/26）' && opkg remove luci-i18n-base-vi --force-removal-of-dependent-packages --autoremove 
echo '（26/26）' && opkg remove luci-i18n-base-zh-tw --force-removal-of-dependent-packages --autoremove 
#卸载主题
#echo 'remove luci-theme-argon（1/3）' 
#opkg remove luci-theme-argon 
echo 'remove luci-theme-material（1/2）' 
opkg remove luci-theme-material 
echo 'remove luci-theme-openwrt-2020（2/2）' 
opkg remove luci-theme-openwrt-2020 
#卸载插件
echo 'remove luci-app-ntpc（1/12）'
opkg remove luci-app-ntpc --force-removal-of-dependent-packages
opkg remove ntpclient --force-depends
echo 'remove luci-app-nft-qos（2/12）'
opkg remove luci-app-nft-qos --force-removal-of-dependent-packages
opkg remove nft-qos --force-depends
echo 'remove uci-app-adblock（3/12）' 
opkg remove luci-app-adblock --force-removal-of-dependent-packages
opkg remove adblock --force-depends
echo 'remove luci-app-nlbwmon（4/12）' 
opkg remove luci-app-nlbwmon --force-removal-of-dependent-packages
opkg remove nlbwmon --force-depends
echo 'luci-app-watchcat（5/12）' 
opkg remove luci-app-watchcat --force-removal-of-dependent-packages 
opkg remove watchcat --force-depends
echo 'remove luci-app-upnp（6/12）' 
opkg remove luci-app-upnp --force-removal-of-dependent-packages
opkg remove miniupnpd --force-depends
echo 'remove luci-app-smartdns（7/12）' 
opkg remove luci-app-smartdns --force-removal-of-dependent-packages
opkg remove smartdns --force-depends
echo 'remove luci-app-aria2（8/12）' 
opkg remove luci-app-aria2 --force-removal-of-dependent-packages 
opkg remove aria2 --force-depends
echo 'remove luci-app-hd-idle（9/12）' 
opkg remove luci-app-hd-idle --force-removal-of-dependent-packages 
opkg remove hd-idle --force-depends
echo 'remove luci-app-minidlna（10/12）' 
opkg remove luci-app-minidlna --force-removal-of-dependent-packages
opkg remove minidlna --force-depends
echo 'remove luci-app-sqm（11/12）' 
opkg remove luci-app-sqm --force-removal-of-dependent-packages
opkg remove sqm-scripts --force-depends
echo 'remove luci-app-samba4（12/12）' 
opkg remove luci-app-samba4 --force-removal-of-dependent-packages
opkg remove samba4-server --force-depends
opkg remove samba4-libs --force-depends
#删除文件
rm -rf "/etc/config/watchcat"
rm -rf "/etc/config/ucitrack"
rm -rf "/etc/config/sqm"
rm -rf "/etc/config/smartdns"
rm -rf "/etc/config/samba4"
rm -rf "/etc/config/ntpclient"
rm -rf "/etc/config/nlbwmon"
rm -rf "/etc/config/nft-qos"
rm -rf "/etc/config/minidlna"
rm -rf "/etc/config/hd-idle"
rm -rf "/etc/config/aria2"
rm -rf "/etc/config/adblock"
rm -rf "/etc/adblock"
rm -rf "/etc/sqm"
rm -rf "/etc/smartdns"
rm -rf "/etc/samba"
#默认
sed -i -e "s|option lang.*|option lang 'zh_cn'|g" $dir2
#sed -i -e "s|option mediaurlbase.*|option mediaurlbase '/luci-static/bootstrap'|g" $dir2
#删除语言
sed -i '/option bg^*/'d $dir2
sed -i '/option ca^*/'d $dir2
sed -i '/option cs^*/'d $dir2
sed -i '/option de^*/'d $dir2
sed -i '/option el^*/'d $dir2
sed -i '/option en^*/'d $dir2
sed -i '/option es^*/'d $dir2
sed -i '/option fr^*/'d $dir2
sed -i '/option he^*/'d $dir2
sed -i '/option hi^*/'d $dir2
sed -i '/option hu^*/'d $dir2
sed -i '/option it^*/'d $dir2
sed -i '/option ja^*/'d $dir2
sed -i '/option ko^*/'d $dir2
sed -i '/option mr^*/'d $dir2
sed -i '/option ms^*/'d $dir2
sed -i '/option pl^*/'d $dir2
sed -i '/option pt^*/'d $dir2
sed -i '/option ro^*/'d $dir2
sed -i '/option ru^*/'d $dir2
sed -i '/option sk^*/'d $dir2
sed -i '/option sv^*/'d $dir2
sed -i '/option tr^*/'d $dir2
sed -i '/option uk^*/'d $dir2
sed -i '/option vi^*/'d $dir2
sed -i '/option zh_tw^*/'d $dir2
#删除主题
#sed -i '/option Argon^*/'d $dir2
sed -i '/option BootstrapDark^*/'d $dir2
sed -i '/option BootstrapLight^*/'d $dir2
sed -i '/option Material^*/'d $dir2
sed -i '/option OpenWrt2020^*/'d $dir2
#添加仓库
if ! grep -q "openwrt_kiddin9" $dir; then
  sed -i '$a\src/gz openwrt_kiddin9 https://op.supes.top/packages/aarch64_cortex-a53' $dir
fi

echo '================================='
echo '==========操作完成================'
echo '================================='
