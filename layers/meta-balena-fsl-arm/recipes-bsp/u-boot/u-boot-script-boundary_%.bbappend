FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-bootscript-yocto.txt-Allow-flashing-integrate-balena.patch \
"

SRC_URI_append_nitrogen8mm-dwe = " \
    file://bootscript-n8mm-dwe-Integrate-with-BalenaOS.patch \
"
