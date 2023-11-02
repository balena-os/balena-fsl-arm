UBOOT_KCONFIG_SUPPORT="1"
BALENA_UBOOT_DEVICE_TYPES="mmc"
inherit resin-u-boot

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:imx8mm-lpddr4-evk = " \
    file://0001-nitrogen8mm_env-common-Force-using-default-environment.patch \
    file://0002-fixup-imx8mm-evk-fdt-addr.patch \
    file://balenaos_tweaks-imx.cfg \
    file://increase-early-malloc.cfg \
"
