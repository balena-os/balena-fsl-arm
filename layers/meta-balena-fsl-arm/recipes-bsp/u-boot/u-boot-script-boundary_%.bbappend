FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://bootscript-n8mm-allow-flashing-balenaOS.patch \
"

# emgw3 and nitrogen8mm-dwe inherit N8MM but they both lack the microSD slot and are flashed over USB so they need to use a slightly different boot.scr from what nitrogen8mm uses
SRC_URI:remove:emgw3 = "file://bootscript-n8mm-allow-flashing-balenaOS.patch"
SRC_URI:remove:nitrogen8mm-dwe = "file://bootscript-n8mm-allow-flashing-balenaOS.patch"

SRC_URI:append:emgw3 = " \
    file://bootscript-n8mm-dwe-Integrate-with-BalenaOS.patch \
"

SRC_URI:append:nitrogen8mm-dwe = " \
    file://bootscript-n8mm-dwe-Integrate-with-BalenaOS.patch \
"
