#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' openwrt/package/base-files/files/bin/config_generate

#gao2. disable https redirect
sed -i 's/option redirect_https\t1/option redirect_https\t0/g' openwrt/package/network/services/uhttpd/files/uhttpd.config

#gao3. use auth for ttyd in port 7681
sed -i "s/option command.*/option command '\/bin\/login'/g" openwrt/staging_dir/target-x86_64_musl/root-x86/etc/config/ttyd

#gao4. use auth for all console login
sed -i "s/\/usr\/libexec\/login\.sh/\/bin\/login/g" ./target/linux/x86/base-files/etc/inittab
