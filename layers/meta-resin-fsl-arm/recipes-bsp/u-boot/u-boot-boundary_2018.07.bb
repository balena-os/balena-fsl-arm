UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

require recipes-bsp/u-boot/u-boot.inc
require recipes-bsp/u-boot/u-boot-boundary-common_2017.07.inc

LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"

PROVIDES += "u-boot"

PV = "v2018.07+git${SRCPV}"

SRCREV = "f06d4679cc820ee22e7af40fee096d58994e1b1a"
SRCBRANCH = "boundary-v2018.07"

# resin-u-boot class patch is rebased
SRC_URI_remove = " file://resin-specific-env-integration-kconfig.patch"
SRC_URI_append = " file://nitrogen6x-resin-specific-env-integration-kconfig.patch"

SRC_URI_append_nitrogen6x    = " file://nitrogen6x-integrate-balena.patch"

# Nitrogen6XQ overrides Nitrogen6X using specific uboot configs
SRC_URI_remove_nitrogen6xq2g = " file://nitrogen6x-integrate-balena.patch"
SRC_URI_append_nitrogen6xq2g = " file://nitrogen6xq2g-integrate-balena.patch"

COMPATIBLE_MACHINE = "(nitrogen6x-lite|nitrogen6x|nitrogen6sx|nitrogen7|nitrogen6xq2g)"
