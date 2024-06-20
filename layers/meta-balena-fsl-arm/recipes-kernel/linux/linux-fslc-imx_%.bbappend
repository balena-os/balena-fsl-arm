FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

inherit kernel-balena

# Disable commit SHA in kernel version string
SCMVERSION:imx8mm-lpddr4-evk ="n"

SRC_URI:append:imx8mm-lpddr4-evk = " \
        file://0002-disable-caam-jr2.patch \
        file://enable-iwlwifi.cfg \
        file://extra-kernel.cfg \
"

