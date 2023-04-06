#
# Nitrogen6x Quad 2GB RAM
#
IMAGE_FSTYPES:append:nitrogen6xq2g = " balenaos-img"

# Customize balenaos-img
BALENA_IMAGE_BOOTLOADER:nitrogen6xq2g = "u-boot"
BALENA_BOOT_PARTITION_FILES:nitrogen6xq2g = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    zImage-imx6dl-nitrogen6x.dtb:/imx6dl-nitrogen6x.dtb \
    zImage-imx6q-nitrogen6_max.dtb:/imx6q-nitrogen6_max.dtb \
    zImage-imx6q-nitrogen6x.dtb:/imx6q-nitrogen6x.dtb \
    zImage-imx6q-sabrelite.dtb:/imx6q-sabrelite.dtb \
    u-boot-${MACHINE}.imx:/u-boot.imx \
    u-boot-flasher.sh:/u-boot-flasher.sh \
"

IMAGE_INSTALL:append:nitrogen6xq2g = " \
                                       mtd-utils \
                                       u-boot-flasher \
"

DEPENDS:append:nitrogen6xq2g = " u-boot-flasher"

#
# Nitrogen6x
#
IMAGE_FSTYPES:append:nitrogen6x = " balenaos-img"

# Customize balenaos-img
BALENA_IMAGE_BOOTLOADER:nitrogen6x = "u-boot"
BALENA_BOOT_PARTITION_FILES:nitrogen6x = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    zImage-imx6dl-nitrogen6x.dtb:/imx6dl-nitrogen6x.dtb \
    zImage-imx6q-nitrogen6_max.dtb:/imx6q-nitrogen6_max.dtb \
    zImage-imx6q-nitrogen6x.dtb:/imx6q-nitrogen6x.dtb \
    zImage-imx6q-sabrelite.dtb:/imx6q-sabrelite.dtb \
    "

IMAGE_CMD:balenaos-img:append:nitrogen6x () {
    # nitrogen6x needs uboot written at a specific location
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.imx of=${BALENA_RAW_IMG} conv=notrunc seek=2 bs=512
}

#
# SolidRun-imx6
#

IMAGE_FSTYPES:append:solidrun-imx6 = " balenaos-img"

# Customize balenaos-img
BALENA_IMAGE_BOOTLOADER:solidrun-imx6 = "u-boot"
BALENA_BOOT_PARTITION_FILES:solidrun-imx6 = " \
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

IMAGE_CMD:balenaos-img:append:solidrun-imx6 () {
    # solidrun-imx6 needs uboot written at a specific location along with SPL
    dd if=${DEPLOY_DIR_IMAGE}/${SPL_BINARY} of=${BALENA_RAW_IMG} conv=notrunc seek=1 bs=1K
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.${UBOOT_SUFFIX} of=${BALENA_RAW_IMG} conv=notrunc seek=69 bs=1K
}

#
# SolidRun SolidSense solidrun-n6g
#
IMAGE_FSTYPES:append:solidrun-n6g = " balenaos-img"
BALENA_IMAGE_BOOTLOADER:solidrun-n6g = "u-boot"
BALENA_BOOT_PARTITION_FILES:solidrun-n6g = " \
    zImage-initramfs-${MACHINE}.bin:/zImage \
    imx6dl-hummingboard2-emmc-som-v15.dtb:/imx6dl-hummingboard2-emmc-som-v15.dtb \
    imx6q-hummingboard2-emmc-som-v15.dtb:/imx6q-hummingboard2-emmc-som-v15.dtb \
    ${SPL_BINARY}:/${SPL_BINARY} \
    u-boot-${MACHINE}.${UBOOT_SUFFIX}:/u-boot-${MACHINE}.${UBOOT_SUFFIX} \
"
IMAGE_CMD:balenaos-img:append:solidrun-n6g () {
    # SolidRun SolidSense solidrun-n6g needs uboot written at a specific location along with SPL
    dd if=${DEPLOY_DIR_IMAGE}/${SPL_BINARY} of=${BALENA_RAW_IMG} conv=notrunc seek=1 bs=1K
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.${UBOOT_SUFFIX} of=${BALENA_RAW_IMG} conv=notrunc seek=69 bs=1K
}


IMAGE_FSTYPES:append:nitrogen8mm = " balenaos-img"
BALENA_IMAGE_BOOTLOADER:nitrogen8mm = "u-boot"
BALENA_BOOT_PARTITION_FILES:nitrogen8mm = " \
    imx8mm-nitrogen8mm.dtb:/imx8mm-nitrogen8mm.dtb \
    imx8mm-nitrogen8mm_rev2.dtb:/imx8mm-nitrogen8mm_rev2.dtb \
    imx8mm-nitrogen8mm_rev2-m4.dtb:/imx8mm-nitrogen8mm_rev2-m4.dtb \
    boot.scr-${MACHINE}:/boot.scr \
    imx-boot:/imx-boot \
"

BALENA_BOOT_PARTITION_FILES:nitrogen8mm-dwe = " \
    imx8mm-dwe.dtb:/imx8mm-dwe.dtb \
    boot.scr-${MACHINE}:/boot.scr \
    imx-boot:/imx-boot \
"

# up the rootfs size to be safe for future increases
IMAGE_ROOTFS_SIZE:emgw3="409600"

BALENA_BOOT_PARTITION_FILES:emgw3 = " \
    imx8mm-em.dtb:/imx8mm-em.dtb \
    boot.scr-${MACHINE}:/boot.scr \
    imx-boot:/imx-boot \
"

IMAGE_INSTALL:append:nitrogen8mm = " \
	firmware-imx-8m \
	kernel-module-imx-gpu-viv \
	kernel-module-qcacld \
	linux-firmware-bdsdmac \
	u-boot-script-boundary \
	kernel-devicetree \
"

IMAGE_INSTALL:append:emgw3 = " \
	silex-uart \
	udev-rules-bt \
"

DEPENDS:append:nitrogen8mm += "imx-boot"

# the BSP sets this variable in the machine conf so let's unset it since this makes our build fail
unset ROOTFS_SIZE
