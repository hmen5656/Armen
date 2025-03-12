#!/bin/bash

set -euo pipefail  # strict mode

# https://github.com/balena-io-examples/balena-timezone

# Default to UTC if no TZ env variable is set
echo "Setting time zone to ${TZ=UTC}"
# This only works on Debian-based images
ln -fs "/usr/share/zoneinfo/${TZ}" /etc/localtime
dpkg-reconfigure tzdata

service cron start

# https://www.balena.io/docs/learn/develop/hardware/i2c-and-spi/
modprobe i2c-dev && modprobe w1-gpio && modprobe w1-therm

# Start your application here.
export GROWIN_MODULE_ID=${GROWIN_MODULE_ID:-${BALENA_DEVICE_NAME_AT_INIT:-$(hostname -s)}}

# python ./scripts/run.py
