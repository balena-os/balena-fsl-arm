FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-bootscript-yocto.txt-Allow-flashing-integrate-balena.patch \
"

SRC_URI_append_nitrogen8mm-dwe = " \
    file://n8mm-dwe-disable-bootscript-flasher.patch \
    file://n8mm-dwe-bootscript-Disable-sd-boot.patch \
"
