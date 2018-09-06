UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-Integrate-Resin-u-boot-enivroment.patch \
"
