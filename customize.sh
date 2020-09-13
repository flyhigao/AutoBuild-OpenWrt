#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.2.2/g' openwrt/package/base-files/files/bin/config_generate

#gao2. disable https redirect
sed -i 's/option redirect_https\t1/option redirect_https\t0/g' openwrt/package/network/services/uhttpd/files/uhttpd.config
if  ! grep 443 openwrt/package/network/services/uhttpd/files/uhttpd.config ;then
        sed -i '/0.0.0.0:80/a\\tlist listen_https\t'0.0.0.0:443'' openwrt/package/network/services/uhttpd/files/uhttpd.config
fi

#gao3. use auth for ttyd in port 7681
sed -i "s/option command.*/option command '\/bin\/login'/g" openwrt/feeds/packages/utils/ttyd/files/ttyd.config

#gao4. use auth for all console login
sed -i "s/\/usr\/libexec\/login\.sh/\/bin\/login/g" openwrt/target/linux/x86/base-files/etc/inittab
