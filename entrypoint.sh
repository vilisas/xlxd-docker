#!/bin/sh
#
# XLXD Startup script
#

if [ -z "$XLX_REFLECTOR_NAME" ]; then
    echo "XLX_REFLECTOR_NAME is unset"
    exit 1
fi

if [ -z "$XLX_XLXD_IP" ]; then
    echo "XLX_XLXD_IP is unset"
    exit 1
fi
if [ -z "$XLX_AMBED_IP" ]; then
    echo "XLX_AMBED_IP is unset"
    exit 1
fi



echo "Starting..
Env values are set to:
XLX_REFLECTOR_NAME=$XLX_REFLECTOR_NAME
      XLX_XLXDX_IP=$XLX_XLXD_IP
      XLX_AMBED_IP=$XLX_AMBED_IP
"


/usr/sbin/apache2ctl start
cd /xlxd
/
/xlxd/xlxd $XLX_REFLECTOR_NAME $XLX_XLXD_IP $XLX_AMBED_IP 
/usr/sbin/apache2ctl stop
