#
# Common settings for both Artik 5 and Artik 10
#

IMAGE_FSTYPES_append = " resin-sdcard"

# Customize resin-sdcard
RESIN_IMAGE_BOOTLOADER = "u-boot-artik"
RESIN_BOOT_PARTITION_FILES_append = " \
    zImage-${MACHINE}.bin:/zImage \
"

#
# Samsung Artik 5
#

# Customize resin-sdcard
RESIN_BOOT_PARTITION_FILES_append_artik5 = " \
    zImage-${KERNEL_DEVICETREE}:/exynos3250-artik5.dtb \
"

IMAGE_CMD_resin-sdcard_append_artik5 () {
    # artik5 needs u-boot env data bin written at a specific location for both SD card and eMMC boot
    dd if=${DEPLOY_DIR_IMAGE}/${UBOOT_ENV_BIN} of=${RESIN_SDIMG} conv=notrunc bs=512 seek=1031
}

#
# Samsung Artik 10
#

# Customize resin-sdcard
RESIN_BOOT_PARTITION_FILES_append_artik10 = " \
    zImage-${KERNEL_DEVICETREE}:/exynos5422-artik10.dtb \
"

IMAGE_CMD_resin-sdcard_append_artik10 () {
    # artik10 needs u-boot env data bin written at a specific location for both SD card and eMMC boot
    dd if=${DEPLOY_DIR_IMAGE}/${UBOOT_ENV_BIN} of=${RESIN_SDIMG} conv=notrunc bs=512 seek=1231
}
