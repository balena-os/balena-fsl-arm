FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://bootscript-n8mm-allow-flashing-balenaOS.patch \
"

# Override bsp layer autorev and use latest revision
SRCREV="475d7e6b91375fe207ca37927b6e096aa1a4a360"

# DWE inherits N8MM
SRC_URI:remove:nitrogen8mm-dwe = "file://bootscript-n8mm-allow-flashing-balenaOS.patch"

SRC_URI:append:nitrogen8mm-dwe = " \
    file://bootscript-n8mm-dwe-Integrate-with-BalenaOS.patch \
"
