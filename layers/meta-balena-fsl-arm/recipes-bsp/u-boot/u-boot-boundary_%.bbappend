UBOOT_KCONFIG_SUPPORT="1"
BALENA_UBOOT_DEVICE_TYPES="usb mmc"
inherit resin-u-boot

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# resin-u-boot class patch is rebased
SRC_URI:remove = " file://resin-specific-env-integration-kconfig.patch"
SRC_URI:append = " file://nitrogen-resin-specific-env-integration-kconfig.patch"

SRC_URI:append:nitrogen8mm = " \
    file://0001-nitrogen8mm_env-common-Force-using-default-environment.patch \
    file://balenaos_tweaks.cfg \
"
