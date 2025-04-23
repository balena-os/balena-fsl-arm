UBOOT_KCONFIG_SUPPORT="1"
BALENA_UBOOT_DEVICE_TYPES="usb mmc"
inherit resin-u-boot

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:nitrogen8mm = " \
    file://0001-nitrogen8mm_env-common-Force-using-default-environment.patch \
    file://balenaos_tweaks.cfg \
"

BALENA_DEVICE_FDT_ADDR_VAR:nitrogen8mm = "a_fdt"
BALENA_DEVICE_KERNEL_ADDR_VAR:nitrogen8mm = "a_zImage"
