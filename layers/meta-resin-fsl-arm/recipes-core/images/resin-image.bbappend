#
# Nitrogen6x
#

IMAGE_FSTYPES_append_nitrogen6x = " resinos-img"

# Customize resinos-img
RESIN_IMAGE_BOOTLOADER_nitrogen6x = "u-boot"
RESIN_BOOT_PARTITION_FILES_nitrogen6x = " \
    ${KERNEL_IMAGETYPE}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    zImage-imx6dl-nitrogen6x.dtb:/imx6dl-nitrogen6x.dtb \
    zImage-imx6q-nitrogen6_max.dtb:/imx6q-nitrogen6_max.dtb \
    zImage-imx6q-nitrogen6x.dtb:/imx6q-nitrogen6x.dtb \
    zImage-imx6q-sabrelite.dtb:/imx6q-sabrelite.dtb \
    6x_bootscript-${MACHINE}:/6x_bootscript \
    "

IMAGE_CMD_resinos-img_append_nitrogen6x () {
    # nitrogen6x needs uboot written at a specific location
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.imx of=${RESIN_RAW_IMG} conv=notrunc seek=2 bs=512
}

#
# SolidRun-imx6
#

IMAGE_FSTYPES_append_solidrun-imx6 = " resinos-img"

# Customize resinos-img
RESIN_IMAGE_BOOTLOADER_solidrun-imx6 = "u-boot"
RESIN_BOOT_PARTITION_FILES_solidrun-imx6 = " \
    zImage-initramfs-${MACHINE}.bin:/zImage \
    uEnv-${MACHINE}.txt:/uEnv.txt \
    zImage-imx6dl-cubox-i.dtb:/imx6dl-cubox-i.dtb \
    zImage-imx6q-cubox-i.dtb:/imx6q-cubox-i.dtb \
    zImage-imx6dl-hummingboard.dtb:/imx6dl-hummingboard.dtb \
    zImage-imx6q-hummingboard.dtb:/imx6q-hummingboard.dtb \
    zImage-imx6dl-hummingboard2.dtb:/imx6dl-hummingboard2.dtb \
    zImage-imx6q-hummingboard2.dtb:/imx6q-hummingboard2.dtb \
    zImage-imx6dl-cubox-i-som-v15.dtb:/imx6dl-cubox-i-som-v15.dtb \
    zImage-imx6q-cubox-i-som-v15.dtb:/imx6q-cubox-i-som-v15.dtb \
    zImage-imx6dl-hummingboard-som-v15.dtb:/imx6dl-hummingboard-som-v15.dtb \
    zImage-imx6q-hummingboard-som-v15.dtb:/imx6q-hummingboard-som-v15.dtb \
    zImage-imx6dl-hummingboard2-som-v15.dtb:/imx6dl-hummingboard2-som-v15.dtb \
    zImage-imx6q-hummingboard2-som-v15.dtb:/imx6q-hummingboard2-som-v15.dtb \
    "

IMAGE_CMD_resinos-img_append_solidrun-imx6 () {
    # solidrun-imx6 needs uboot written at a specific location along with SPL
    dd if=${DEPLOY_DIR_IMAGE}/${SPL_BINARY} of=${RESIN_RAW_IMG} conv=notrunc seek=1 bs=1K
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.${UBOOT_SUFFIX} of=${RESIN_RAW_IMG} conv=notrunc seek=69 bs=1K
}
