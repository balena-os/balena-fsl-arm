SUMMARY = "gecko uart attach service"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
LICENSE = "MIT"

SRC_URI = "file://sl-uart.service \
	   file://sl-uart.sh \
"

inherit systemd

do_install:append() {

    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
        install -m 644 ${WORKDIR}/sl-uart.service ${D}${systemd_unitdir}/system
    fi

	install -d ${D}${datadir}/gecko-uart/
	install -m 755 ${WORKDIR}/sl-uart.sh ${D}${datadir}/gecko-uart/
}

FILES:${PN} += "/usr/share/gecko-uart/*"

SYSTEMD_SERVICE:${PN} = "sl-uart.service"
