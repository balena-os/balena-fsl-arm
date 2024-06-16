do_install:append () {
	install -d ${D}${base_libdir}/udev
	mv ${D}/${sysconfdir}/udev ${D}${base_libdir}/
}
