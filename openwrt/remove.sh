#!/bin/bash
dir="/etc/opkg/customfeeds.conf"
echo 'remove luci-app-nft-qos（1/11）' &&
opkg remove luci-app-nft-qos --force-removal-of-dependent-packages --autoremove &&
echo 'remove uci-app-adblock（2/11）' &&
opkg remove luci-app-adblock --force-removal-of-dependent-packages --autoremove &&
echo 'remove luci-app-nlbwmon（3/11）' &&
opkg remove luci-app-nlbwmon --force-removal-of-dependent-packages --autoremove &&
echo 'luci-app-watchcat（4/11）' &&
opkg remove luci-app-watchcat --force-removal-of-dependent-packages --autoremove &&
echo 'remove luci-app-upnp（5/11）' &&
opkg remove luci-app-upnp --force-removal-of-dependent-packages --autoremove &&
echo 'remove luci-app-smartdns（6/11）' &&
opkg remove luci-app-smartdns --force-removal-of-dependent-packages --autoremove &&
echo 'remove luci-app-aria2（7/11）' &&
opkg remove luci-app-aria2 --force-removal-of-dependent-packages --autoremove &&
echo 'remove luci-app-hd-idle（8/11）' &&
opkg remove luci-app-hd-idle --force-removal-of-dependent-packages --autoremove &&
echo 'remove luci-app-minidlna（9/11）' &&
opkg remove luci-app-minidlna --force-removal-of-dependent-packages --autoremove &&
echo 'remove luci-app-samba4（10/11）' &&
opkg remove luci-app-samba4 --force-removal-of-dependent-packages --autoremove &&
echo 'remove luci-app-sqm（11/11）' &&
opkg remove luci-app-sqm --force-removal-of-dependent-packages --autoremove &&
echo 'remove luci-theme-argon（1/3）' &&
opkg remove luci-theme-argon &&
echo 'remove luci-theme-material（2/3）' &&
opkg remove luci-theme-material &&
echo 'remove luci-theme-openwrt-2020（3/3）' &&
opkg remove luci-theme-openwrt-2020 &&
if ! grep -q "openwrt_kiddin9" $dir; then
  sed -i '$a\src/gz openwrt_kiddin9 https://op.supes.top/packages/aarch64_cortex-a53' $dir
fi
echo '==========OK================'
