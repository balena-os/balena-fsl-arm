do_install() {
        sed -i 's|/lib/firmware|""|g' Makefile
        DESTDIR=${D}${nonarch_base_libdir}/firmware make install
}

FILES:${PN} += "${nonarch_base_libdir}/firmware/* ${nonarch_base_libdir}/firmware/*/*"
