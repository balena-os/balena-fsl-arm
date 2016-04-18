#
# Nitrogen6x
#

IMAGE_FSTYPES_append_nitrogen6x = " resin-sdcard"

# Customize resin-sdcard
RESIN_IMAGE_BOOTLOADER_nitrogen6x = "u-boot"
RESIN_BOOT_PARTITION_FILES_nitrogen6x = " \
    ${KERNEL_IMAGETYPE}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    zImage-imx6dl-nitrogen6x.dtb:/imx6dl-nitrogen6x.dtb \
    zImage-imx6q-nitrogen6_max.dtb:/imx6q-nitrogen6_max.dtb \
    zImage-imx6q-nitrogen6x.dtb:/imx6q-nitrogen6x.dtb \
    zImage-imx6q-sabrelite.dtb:/imx6q-sabrelite.dtb \
    6x_bootscript-${MACHINE}:/6x_bootscript \
    "

IMAGE_CMD_resin-sdcard_append_nitrogen6x () {
    # nitrogen6x needs uboot written at a specific location
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.imx of=${RESIN_SDIMG} conv=notrunc seek=2 bs=512
}

#
# cubox-i
#

IMAGE_FSTYPES_append_cubox-i = " resin-sdcard"

# Customize resin-sdcard
RESIN_IMAGE_BOOTLOADER_cubox-i = "u-boot"
RESIN_BOOT_PARTITION_FILES_cubox-i = " \
    ${KERNEL_IMAGETYPE}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    zImage-imx6dl-cubox-i.dtb:/imx6dl-cubox-i.dtb  \
    zImage-imx6q-cubox-i.dtb:/imx6q-cubox-i.dtb \
    zImage-imx6dl-hummingboard.dtb:/imx6dl-hummingboard.dtb \
    zImage-imx6q-hummingboard.dtb:/imx6q-hummingboard.dtb \
    "

IMAGE_CMD_resin-sdcard_append_cubox-i () {
    # cubox-i needs uboot written at a specific location along with SPL
    dd if=${DEPLOY_DIR_IMAGE}/${SPL_BINARY} of=${RESIN_SDIMG} conv=notrunc seek=2 bs=512
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.${UBOOT_SUFFIX} of=${RESIN_SDIMG} conv=notrunc seek=69 bs=1K
}

#
# imx6qsabresd
#

IMAGE_FSTYPES_append_imx6qsabresd = " resin-sdcard"

# Customize resin-sdcard
RESIN_IMAGE_BOOTLOADER_imx6qsabresd = "u-boot"
RESIN_BOOT_PARTITION_FILES_imx6qsabresd = " \
    ${KERNEL_IMAGETYPE}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    zImage-imx6q-sabresd-enetirq.dtb:/imx6q-sabresd-enetirq.dtb  \
    zImage-imx6q-sabresd-hdcp.dtb:/imx6q-sabresd-hdcp.dtb \
    zImage-imx6q-sabresd-ldo.dtb:/imx6q-sabresd-ldo.dtb \
    zImage-imx6q-sabresd-uart.dtb:/imx6q-sabresd-uart.dtb \
    zImage-imx6q-sabresd.dtb:/imx6q-sabresd.dtb \
    "

IMAGE_CMD_resin-sdcard_append_imx6qsabresd () {
    # imx6qsabresd needs uboot written at a specific location along with SPL
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.imx of=${RESIN_SDIMG} conv=notrunc seek=2 bs=512
}
