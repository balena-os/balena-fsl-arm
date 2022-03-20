FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_KCONFIG_SUPPORT = "1"

inherit resin-u-boot

SRC_URI += " \
    file://balenaos_uboot-add-fat-update-env-size.cfg \
    file://balenaos_uboot-bootcommand.cfg \
"
