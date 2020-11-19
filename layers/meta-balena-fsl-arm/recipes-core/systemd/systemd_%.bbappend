FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append_ccimx6ul = " \
    file://ubifs.rules \
"

do_install_append_ccimx6ul () {
    install -m 0666 ${WORKDIR}/ubifs.rules ${D}/lib/udev/rules.d/60-persistent-storage-ubifs.rules

# TODO: Review this to apply to ubifs filesystems
# Will also need to remove the active/inactive entries from ubifs.rules
    rm ${D}/lib/udev/resin_update_state_probe
}

do_install_append() {
    # disable audit messages
    rm ${D}/lib/systemd/system/sockets.target.wants/systemd-journald-audit.socket
    rm ${D}/lib/systemd/system/systemd-journald-audit.socket
}
