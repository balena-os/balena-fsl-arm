SUMMARY = "Default ubifs images"
DESCRIPTION = "Generate and install default ubifs partitions"
SECTION = "base"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit allarch

do_fetch[noexec] = "1"
do_patch[noexec] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install () {
    mkdir -p ${WORKDIR}/ubifs/
    touch ${WORKDIR}/ubifs/"DO NOT REMOVE THIS FILE"
    mkfs.ubifs -r ${WORKDIR}/ubifs/ -o ${WORKDIR}/default-state.ubifs ${MKUBIFS_BOOT_ARGS}
    mkfs.ubifs -r ${WORKDIR}/ubifs -o ${WORKDIR}/default-data.ubifs ${MKUBIFS_ARGS}
    install -d ${D}/boot/
    cp ${WORKDIR}/default-state.ubifs ${D}/boot/
    cp ${WORKDIR}/default-data.ubifs ${D}/boot/
    ln -s /boot/default-data.ubifs ${D}/boot/default-rootB.ubifs
}

FILES_${PN} = " \
    /boot/default-state.ubifs \
    /boot/default-data.ubifs \
    /boot/default-rootB.ubifs \
"

DEPENDS_append = " mtd-utils-native"
