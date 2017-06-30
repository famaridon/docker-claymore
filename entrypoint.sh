#!/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/cuda:/usr/lib/nvidia

if [ ! -f /claymore/config/claymore_config_nanopool.zip ]; then
    echo "You must add claymore_config_nanopool.zip into volume /claymore/config "
    exit 1
fi

unzip -o /claymore/config/claymore_config_nanopool.zip -d /claymore

chmod +x /claymore/start.sh

cd /claymore

/claymore/start.sh | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
