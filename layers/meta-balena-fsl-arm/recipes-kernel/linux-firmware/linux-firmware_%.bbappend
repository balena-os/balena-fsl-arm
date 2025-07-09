
do_install:prepend(){
    install -d  ${D}/lib/firmware/ti-connectivity/
}


do_install:append() {
    rm -rf ${D}/lib/
    install -d ${D}/${nonarch_base_libdir}/firmware/ti-connectivity/
    cp ${WORKDIR}/TIInit_7.6.15.bts ${D}/${nonarch_base_libdir}/firmware/ti-connectivity/
}


