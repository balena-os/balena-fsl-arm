UBOOT_KCONFIG_SUPPORT="1"
BALENA_UBOOT_DEVICE_TYPES="usb mmc"
inherit resin-u-boot

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# Make sure we include the 3 requested DDR training patches
SRCREV = "f727cf25665279f5e2eecbf03c5450b13cacccea"

# resin-u-boot class patch is rebased
SRC_URI_remove = " file://resin-specific-env-integration-kconfig.patch"
SRC_URI_append = " file://nitrogen-resin-specific-env-integration-kconfig.patch"

SRC_URI_append_nitrogen8mm = " \
    file://0001-add-back-config-defaults.patch \
    file://0001-nitrogen8mm-Use-balenaOS-configs.patch \
    file://0001-nitrogen8mm_env-common-Force-using-default-environment.patch \
"

SRC_URI_append_nitrogen8mm-dwe = " \
    file://nitrogen8mm-dwe-1g-Use-BalenaOS-configs.patch \
"
