#!/bin/sh

#
# This is an adaptation of the
# flash-bootloader hook.
# It writes u-boot to the SPI NOR
#

set -o errexit

function dmesg_log {
        echo "u-boot-flasher: $1" > /dev/kmsg || true
}

uboot_file="u-boot.imx"
uboot_block_size=1024
uboot_seek_blocks=1

device="/dev/mtd0"
block_device="/dev/mtdblock0"

update_files="uboot"
curr_dir=`dirname $0`

# calculate size and md5sum of the binary to update from the update bundle
update_size=$(ls -al "$curr_dir/$uboot_file" | awk '{print $5}')
update_md5sum=$(md5sum "$curr_dir/$uboot_file" | awk '{print $1'})

# calculate number of bytes to skip when computing the checksum of the data we want to update (i.e. the data already written to $device)
let skip_bytes=$uboot_block_size*$uboot_seek_blocks

# calculate md5sum of the data already written to $device, using $update_size bytes and skipping $skip_bytes from $device
existing_md5sum=$(dd if=$block_device skip=$skip_bytes bs=1 count=$update_size status=none | md5sum | awk '{print $1}')

if [ ! "$existing_md5sum" = "$update_md5sum" ]; then
    if [ -x /usr/sbin/flash_erase ]; then
        /usr/sbin/flash_erase $device 0 0
        dmesg_log "Erased SPI NOR prior to flashing u-boot"
    else
        dmesg_log "flash_erase tool not installed, will not erase the SPI NOR before writing u-boot!"
    fi;

    dmesg_log "Will proceed to flash $uboot_file to $block_device"
    dd if=$curr_dir/$uboot_file of=$block_device conv=fdatasync seek=$uboot_seek_blocks bs=$uboot_block_size
    dmesg_log "Flashed u-boot to SPI ROM. Wrote $update_size bytes"
    dmesg_log "!!! Please re-start the board and boot from the BalenaOS SD-CARD !!!"
else
    dmesg_log "No need to flash u-boot"
fi
