FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://bootscript-n8mm-allow-flashing-balenaOS.patch \
"

# DWE inherits N8MM
SRC_URI_remove_nitrogen8mm-dwe = "file://bootscript-n8mm-allow-flashing-balenaOS.patch"

SRC_URI_append_nitrogen8mm-dwe = " \
    file://bootscript-n8mm-dwe-Integrate-with-BalenaOS.patch \
"
