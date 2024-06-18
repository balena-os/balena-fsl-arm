UBOOT_KCONFIG_SUPPORT="1"
BALENA_UBOOT_DEVICE_TYPES="mmc"
inherit resin-u-boot

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:imx8mm-lpddr4-evk = " \
    file://0001-nitrogen8mm_env-common-Force-using-default-environment.patch \
    file://0002-fix-return-vaue-propagatin-out-of-environ.patch \
    file://0001-imx8mm-lpddr4-evk-Integrate-with-BalenaOS.patch \
    file://balenaos_tweaks-imx.cfg \
    file://increase-early-malloc.cfg \
"
