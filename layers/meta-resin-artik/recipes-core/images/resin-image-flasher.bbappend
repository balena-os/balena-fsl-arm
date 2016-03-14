include resin-image.inc

# common settings for Artik 5 and Artik 10

# these files are written onto the mmcblk0boot0 boot partition by u-boot at SD card boot-up
RESIN_BOOT_PARTITION_FILES_append = " \
    bl1.bin:/bl1.bin \
    bl2.bin:/bl2.bin \
    u-boot-${MACHINE}.bin:/u-boot.bin \
    tzsw.bin:/tzsw.bin \
"

# custom uboot binary env data for SD card boot
UBOOT_ENV_BIN = "params_sd.bin"

IMAGE_CMD_resin-sdcard_append () {
    # Artik 5 and Artik 10 need bl1 (signed prebuilt binary), bl2 (espresso3250-spl.bin but at the moment the prebuilt bl2.bin is used
    # because the one compiled from u-boot has stability issues as per Samsung), u-boot.bin and tzsw.bin (TrustZone software)
    # written at specific locations for booting off the SD card.
    dd if=${DEPLOY_DIR_IMAGE}/bl1.bin of=${RESIN_SDIMG} conv=notrunc bs=512 seek=1
    dd if=${DEPLOY_DIR_IMAGE}/bl2.bin of=${RESIN_SDIMG} conv=notrunc bs=512 seek=31
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin of=${RESIN_SDIMG} conv=notrunc bs=512 seek=63
    dd if=${DEPLOY_DIR_IMAGE}/tzsw.bin of=${RESIN_SDIMG} conv=notrunc bs=512 seek=719
}
