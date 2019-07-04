SUMMARY = "TI bluetooth firmware"
DESCRIPTION = "TI bluetooth firmware version newer than in linux-firmware"

SRCREV = "169b2df5b968f0ede32ea9044859942fc220c435"
SRC_URI = "git://github.com/TI-ECS/bt-firmware/"

S = "${WORKDIR}/git"

LICENSE = "Firmware-ti-connectivity"
LIC_FILES_CHKSUM="file://LICENCE;md5=1c9961176d6529283e0d0c983be41b45"

do_compile() {
}

do_install() {
	install -d ${D}${nonarch_base_libdir}/firmware/ti-connectivity
	cp TIInit_11.8.32.bts ${D}${nonarch_base_libdir}/firmware/ti-connectivity
}

FILES_${PN} = "\
	/lib/firmware/ti-connectivity/TIInit_11.8.32.bts \
"
