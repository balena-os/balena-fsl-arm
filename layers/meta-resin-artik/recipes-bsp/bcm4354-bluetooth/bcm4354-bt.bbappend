FILESEXTRAPATHS_append := ":${THISDIR}/files"

# add custom systemd drop-in file (brcm-bt-firmware.conf) to accomodate changes from fwdown_adapt_to_resin.patch (we need to wait for the resin-conf partition to be mounted)
SRC_URI += " \
    file://brcm-bt-firmware.conf \
    file://fwdown_adapt_to_resin.patch \
    "

do_install_append() {
   if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
        install -d ${D}${sysconfdir}/systemd/system/brcm-bt-firmware.service.d
        install -c -m 0644 ${WORKDIR}/brcm-bt-firmware.conf ${D}${sysconfdir}/systemd/system/brcm-bt-firmware.service.d/
    fi
}
