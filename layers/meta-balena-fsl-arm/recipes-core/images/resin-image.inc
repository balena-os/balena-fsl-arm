#
# Nitrogen6x Quad 2GB RAM
#
IMAGE_FSTYPES_append_nitrogen6xq2g = " resinos-img"

# Customize resinos-img
RESIN_IMAGE_BOOTLOADER_nitrogen6xq2g = "u-boot"
RESIN_BOOT_PARTITION_FILES_nitrogen6xq2g = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    zImage-imx6dl-nitrogen6x.dtb:/imx6dl-nitrogen6x.dtb \
    zImage-imx6q-nitrogen6_max.dtb:/imx6q-nitrogen6_max.dtb \
    zImage-imx6q-nitrogen6x.dtb:/imx6q-nitrogen6x.dtb \
    zImage-imx6q-sabrelite.dtb:/imx6q-sabrelite.dtb \
    u-boot-${MACHINE}.imx:/u-boot.imx \
    u-boot-flasher.sh:/u-boot-flasher.sh \
"

IMAGE_INSTALL_append_nitrogen6xq2g = " \
                                       mtd-utils \
                                       u-boot-flasher \
"

DEPENDS_append_nitrogen6xq2g = " u-boot-flasher"

#
# Nitrogen6x
#
IMAGE_FSTYPES_append_nitrogen6x = " resinos-img"

# Customize resinos-img
RESIN_IMAGE_BOOTLOADER_nitrogen6x = "u-boot"
RESIN_BOOT_PARTITION_FILES_nitrogen6x = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    zImage-imx6dl-nitrogen6x.dtb:/imx6dl-nitrogen6x.dtb \
    zImage-imx6q-nitrogen6_max.dtb:/imx6q-nitrogen6_max.dtb \
    zImage-imx6q-nitrogen6x.dtb:/imx6q-nitrogen6x.dtb \
    zImage-imx6q-sabrelite.dtb:/imx6q-sabrelite.dtb \
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
    imx6dl-cubox-i.dtb:/imx6dl-cubox-i.dtb \
    imx6q-cubox-i.dtb:/imx6q-cubox-i.dtb \
    imx6dl-hummingboard.dtb:/imx6dl-hummingboard.dtb \
    imx6q-hummingboard.dtb:/imx6q-hummingboard.dtb \
    imx6dl-hummingboard2.dtb:/imx6dl-hummingboard2.dtb \
    imx6q-hummingboard2.dtb:/imx6q-hummingboard2.dtb \
    imx6dl-cubox-i-som-v15.dtb:/imx6dl-cubox-i-som-v15.dtb \
    imx6q-cubox-i-som-v15.dtb:/imx6q-cubox-i-som-v15.dtb \
    imx6dl-hummingboard-som-v15.dtb:/imx6dl-hummingboard-som-v15.dtb \
    imx6q-hummingboard-som-v15.dtb:/imx6q-hummingboard-som-v15.dtb \
    imx6dl-hummingboard2-som-v15.dtb:/imx6dl-hummingboard2-som-v15.dtb \
    imx6q-hummingboard2-som-v15.dtb:/imx6q-hummingboard2-som-v15.dtb \
    imx6q-hummingboard2-emmc-som-v15.dtb:/imx6q-hummingboard2-emmc-som-v15.dtb \
    imx6dl-hummingboard2-emmc-som-v15.dtb:/imx6dl-hummingboard2-emmc-som-v15.dtb \
    ${SPL_BINARY}:/${SPL_BINARY} \
    u-boot-${MACHINE}.${UBOOT_SUFFIX}:/u-boot-${MACHINE}.${UBOOT_SUFFIX} \
    "

IMAGE_CMD_resinos-img_append_solidrun-imx6 () {
    # solidrun-imx6 needs uboot written at a specific location along with SPL
    dd if=${DEPLOY_DIR_IMAGE}/${SPL_BINARY} of=${RESIN_RAW_IMG} conv=notrunc seek=1 bs=1K
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.${UBOOT_SUFFIX} of=${RESIN_RAW_IMG} conv=notrunc seek=69 bs=1K
}


IMAGE_FSTYPES_append_nitrogen8mm = " resinos-img"
RESIN_IMAGE_BOOTLOADER_nitrogen8mm = "u-boot"
RESIN_BOOT_PARTITION_FILES_nitrogen8mm = " \
    imx8mm-nitrogen8mm.dtb:/imx8mm-nitrogen8mm.dtb \
    imx8mm-nitrogen8mm_rev2.dtb:/imx8mm-nitrogen8mm_rev2.dtb \
    imx8mm-nitrogen8mm_rev2-m4.dtb:/imx8mm-nitrogen8mm_rev2-m4.dtb \
    boot.scr-${MACHINE}:/boot.scr \
    imx-boot:/imx-boot \
"

RESIN_BOOT_PARTITION_FILES_nitrogen8mm-dwe = " \
    imx8mm-dwe.dtb:/imx8mm-dwe.dtb \
    boot.scr-${MACHINE}:/boot.scr \
    imx-boot:/imx-boot \
"

IMAGE_INSTALL_append_nitrogen8mm = " \
	firmware-imx \
	kernel-module-imx-gpu-viv \
	kernel-module-qcacld \
	linux-firmware-bdsdmac \
	u-boot-script-boundary \
"

DEPENDS_append_nitrogen8mm += "imx-boot"

inherit image_types_resin_ubifs

RESIN_ROOT_FSTYPE_ccimx6ul = "hostapp-ubifs"
IMAGE_FSTYPES_ccimx6ul = "hostapp-ubifs boot.ubifs"
RESIN_BOOT_PARTITION_FILES_ccimx6ul = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    ${KERNEL_DEVICETREE}:/${KERNEL_DEVICETREE} \
    ${UBOOT_BOOTSCRIPT}:/${UBOOT_BOOTSCRIPT} \
"
