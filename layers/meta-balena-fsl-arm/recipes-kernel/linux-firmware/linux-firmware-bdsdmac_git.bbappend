# HEAD revision of today
SRCREV_nitrogen8mm = "7c849ee87c9b523820e25c3f6a8f3ecbd3b0fbe7"
SRCBRANCH_nitrogen8mm = "bd-sdmac-qcacld-lea-2.0"

# Preserve firmware branch and revision for DWE
SRCREV_nitrogen8mm-dwe = "5e4b71211ecbb79e7693d2ee07361847f5a0cb40"
SRCBRANCH_nitrogen8mm-dwe = "bd-sdmac-qcacld"

SRC_URI_append_nitrogen8mm = " http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/firmware-qca-2.0.3.bin "
SRC_URI[md5sum] = "29e949d1037a464dcb7e71b45a97280e"
SRC_URI[sha256sum] = "d61220c97aa1e5a875234a95934957b02274cb87c2be74e119e4f093907cf68f"
SRC_URI_remove_nitrogen8mm-dwe = " http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/firmware-qca-2.0.3.bin "

qcacld_lea_2_0_fw_fix() {
    bash "${S}/../firmware-qca-2.0.3.bin" --force --auto-accept
    cp "${S}/firmware-qca-2.0.3/1PJ_QCA9377-3_LEA_2.0/lib/firmware/qca9377/qwlan30.bin" ${D}/lib/firmware/
    rm -rf "${S}/firmware-qca-2.0.3"
    rm "${S}/../firmware-qca-2.0.3.bin"
}


do_install_append_nitrogen8mm() {
    qcacld_lea_2_0_fw_fix
}

do_install_remove_nitrogen8mm-dwe() {
    qcacld_lea_2_0_fw_fix
}
