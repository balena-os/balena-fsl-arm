# Copyright (C) 2019, Digi International

LABEL_TIMEOUT=200

# Wait for /dev/disk/by-label/resin-<part-name> to appear on the sysfs
# arg1: Partition name (i.e state, data or rootB)
#
resin_wait_udev_label() {
        start="$(date +%s)"
        end="$start"
        while [ ! -L "/dev/disk/by-label/resin-$1" ]; do
                if [ $((end - start)) -le "$LABEL_TIMEOUT" ]; then
                        sleep 0.1 && end=$((end + 1))
                else
                        msg "ERROR: Timeout while waiting for filesystem label to appear."
                        return 1
                fi
        done
}

# Check whether there is an existing UBIFS volume
# arg1: Partition name (i.e state, data or rootB)
#
resin_check_ubivol() {
	[ -L "/dev/disk/by-label/resin-$1" ] && return 0
	return 1
}

# Create a new volume and update it with a default UBI filesystem
# arg1: Partition name (i.e state, data or rootB)
# arg2: UBI device (i.e /dev/ubi0)
#
resin_mkubivol() {
        ubimkvol $2 -N resin-$1 -m || debug "Cannot make volume for resin-$1 at $2" || return 1
        resin_wait_udev_label $1 || return 1
        ubiupdatevol "/dev/disk/by-label/resin-$1" "/boot/default-$1.ubifs" && info "INFO: Success initializing resin-$1" && return 0
        return 1
}
