do_install() {
    mkdir -p ${D}/${nonarch_base_libdir}/firmware/silead
    install -m 0644 ${WORKDIR}/gsl1680.fw ${D}/${nonarch_base_libdir}/firmware/silead/
}

FILES_${PN} += "${nonarch_base_libdir}/firmware/*"
