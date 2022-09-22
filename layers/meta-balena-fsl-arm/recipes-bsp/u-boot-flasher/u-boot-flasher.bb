FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DESCRIPTION = "Systemd services used to update u-boot on NOR"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit allarch systemd

SRC_URI = "file://u-boot-flasher.service \
           file://u-boot-flasher.sh \
"

RDEPENDS:${PN} = " bash systemd"

do_install () {
   install -d ${D}/${systemd_unitdir}/system
   install -m 644 ${WORKDIR}/u-boot-flasher.service ${D}/${systemd_unitdir}/system/u-boot-flasher.service
   install -m 755 ${WORKDIR}/u-boot-flasher.sh ${DEPLOY_DIR_IMAGE}/u-boot-flasher.sh
}

PROVIDES = "u-boot-flasher"

# If package exists in cache,
# it won't install script to image
# deploy dir. Force it to do so.
do_install[nostamp] = "1"

FILES:${PN} = " \
	u-boot-flasher.service \
	u-boot-flasher.sh \
"
SYSTEMD_SERVICE:${PN} = "u-boot-flasher.service"
