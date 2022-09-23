FILESEXTRAPATHS:append:emgw3 := ":${THISDIR}/${PN}"

SRC_URI:append:emgw3 = " file://silex-imx8mm-emgw3.conf"

SILEX_CONF:emgw3 = "silex-imx8mm-emgw3.conf"
