#!/bin/bash
dir="/etc/opkg/customfeeds.conf"
opkg remove luci-app-nft-qos --force-removal-of-dependent-packages --autoremove &&
opkg remove luci-app-adblock --force-removal-of-dependent-packages --autoremove &&
opkg remove luci-app-nlbwmon --force-removal-of-dependent-packages --autoremove &&
opkg remove luci-app-watchcat --force-removal-of-dependent-packages --autoremove &&
opkg remove luci-app-upnp --force-removal-of-dependent-packages --autoremove &&
opkg remove luci-app-smartdns --force-removal-of-dependent-packages --autoremove &&
opkg remove luci-app-aria2 --force-removal-of-dependent-packages --autoremove &&
opkg remove luci-app-hd-idle --force-removal-of-dependent-packages --autoremove &&
opkg remove luci-app-minidlna --force-removal-of-dependent-packages --autoremove &&
opkg remove luci-app-samba4 --force-removal-of-dependent-packages --autoremove &&
opkg remove luci-app-sqm --force-removal-of-dependent-packages --autoremove &&
opkg remove luci-theme-argon &&
opkg remove luci-theme-material &&
opkg remove luci-theme-openwrt-2020 &&
sed -i '$a\src/gz openwrt_kiddin9 https://op.supes.top/packages/aarch64_cortex-a53' $dir
