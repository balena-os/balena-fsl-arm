FILESEXTRAPATHS:append := ":${THISDIR}/files"

inherit allarch systemd

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI += " \
    file://nitrogen8mm-bluetooth.sh \
    file://nitrogen8mm-bluetooth.service \
    file://nitrogen8mm-hci.service \
"

FILES:${PN} = " \
    /lib/systemd/nitrogen8mm-bluetooth.sh \
    /lib/systemd/system/nitrogen8mm-bluetooth.service \
    /lib/systemd/system/nitrogen8mm-hci.service \
"

SYSTEMD_SERVICE:${PN} = "nitrogen8mm-bluetooth.service nitrogen8mm-hci.service"

RDEPENDS:${PN} = " bash systemd"

do_install:append() {
    install -d ${D}/${systemd_unitdir}/system
    install -m 644 ${WORKDIR}/nitrogen8mm-bluetooth.service ${D}/${systemd_unitdir}/system
    install -m 644 ${WORKDIR}/nitrogen8mm-hci.service ${D}/${systemd_unitdir}/system
    install -m 755 ${WORKDIR}/nitrogen8mm-bluetooth.sh  ${D}/${systemd_unitdir}/
}

COMPATIBLE_MACHINE="nitrogen8mm"
