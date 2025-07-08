SRC_URI:remove = "https://git.ti.com/ti-bt/service-packs/blobs/raw/54f5c151dacc608b19ab2ce4c30e27a3983048b2/initscripts/TIInit_7.6.15.bts;name=TIInit_7.6.15"

SRC_URI:append = " \
    https://git.ti.com/cgit/ti-bt/service-packs/plain/initscripts/TIInit_7.6.15.bts?id=54f5c151dacc608b19ab2ce4c30e27a3983048b2 \
"

do_install:prepend(){
    install -d  ${D}/lib/firmware/ti-connectivity/
}


do_install:append() {
    rm -rf ${D}/lib/
    install -d ${D}/${nonarch_base_libdir}/firmware/ti-connectivity/
    cp ${WORKDIR}/TIInit_7.6.15.bts ${D}/${nonarch_base_libdir}/firmware/ti-connectivity/
}


