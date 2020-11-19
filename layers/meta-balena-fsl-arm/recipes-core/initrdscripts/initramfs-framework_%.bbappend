FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://init-common.sh \
    file://init-state \
    file://init-data \
    file://init-rootB \
"

do_install_append() {
    install -m 0755 ${WORKDIR}/init-common.sh ${D}/init.d/
    install -m 0755 ${WORKDIR}/init-state ${D}/init.d/86-initstate
    install -m 0755 ${WORKDIR}/init-data ${D}/init.d/86-initdata
    install -m 0755 ${WORKDIR}/init-rootB ${D}/init.d/86-initrootB
}

PACKAGES_append_ccimx6ul = " initramfs-module-ubifs-prepare-parts"

SUMMARY_initramfs-module-ubifs-prepare-parts = "Prepare empty ubifs partitions for use"
RDEPENDS_initramfs-module-ubifs-prepare-parts = "${PN}-base mtd-utils-ubifs"
FILES_initramfs-module-ubifs-prepare-parts = " \
    init.d/init-common.sh \
    init.d/86-initstate \
    init.d/86-initdata \
    init.d/86-initrootB \
"
