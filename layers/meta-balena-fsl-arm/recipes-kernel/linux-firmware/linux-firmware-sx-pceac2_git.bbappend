do_install() {
	install -d ${D}${nonarch_base_libdir}/firmware
	cp -r ${S}/* ${D}${nonarch_base_libdir}/firmware/
}

FILES_${PN} += "/${nonarch_base_libdir}/firmware/* /${nonarch_base_libdir}/firmware/*/*"
