# Copyright (C) 2018 Digi International

FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot

SRC_URI_append_ccimx6ul = "\
    file://0001-ccimx6ul-Add-BalenaOS-environment-customization.patch \
"
