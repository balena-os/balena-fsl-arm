UBOOT_KCONFIG_SUPPORT="1"
inherit resin-u-boot

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# Override bsp layer autorev and use latest revision
SRCREV="d18a2c25e47c0d71e45335772400386c021fb6cb"

# resin-u-boot class patch is rebased
SRC_URI_remove = " file://resin-specific-env-integration-kconfig.patch"
SRC_URI_append = " file://nitrogen-resin-specific-env-integration-kconfig.patch"

SRC_URI_append_nitrogen8mm = " \
    file://0001-nitrogen8mm-Use-balenaOS-configs.patch \
    file://0001-nitrogen8mm_env-common-Force-using-default-environment.patch \
"

SRC_URI_append_nitrogen8mm-dwe = " \
    file://nitrogen8mm-dwe-Use-balenaOS-configs.patch \
"
