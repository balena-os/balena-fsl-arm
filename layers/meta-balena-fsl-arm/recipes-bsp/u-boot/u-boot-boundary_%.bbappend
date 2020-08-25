UBOOT_KCONFIG_SUPPORT="1"
RESIN_UBOOT_DEVICE_TYPES="usb mmc"
inherit resin-u-boot

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# Override bsp layer autorev and use latest revision
SRCREV="cc96aa68fb9ee1dc1381c71704681a34828f18ad"

# resin-u-boot class patch is rebased
SRC_URI_remove = " file://resin-specific-env-integration-kconfig.patch"
SRC_URI_append = " file://nitrogen-resin-specific-env-integration-kconfig.patch"

SRC_URI_append_nitrogen8mm = " \
    file://0001-nitrogen8mm-Use-balenaOS-configs.patch \
    file://0001-nitrogen8mm_env-common-Force-using-default-environment.patch \
"

SRC_URI_append_nitrogen8mm-dwe = " \
    file://nitrogen8mm-dwe-1g-Use-BalenaOS-configs.patch \
"
