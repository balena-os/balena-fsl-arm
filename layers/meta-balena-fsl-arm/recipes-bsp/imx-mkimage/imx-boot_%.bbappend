# Use latest and known to work revision. Otherwise if
# booting fails at some point we won't know what caused it
SRCREV="dc22e26d07f249325604f7dfd42324a9a75e7cc0"

# In this case, MACHINE gets unset and imxboot_targets defaults to MX8QM.
# Force iMX8MM SOC to fix failed booting.
IMXBOOT_TARGETS_nitrogen8mm-dwe = "u-boot-lpddr4-iMX8MM-2g.nohdmibin"

compile_mx8m() {
    bbnote 8MQ/8MM boot binary build
    for ddr_firmware in ${DDR_FIRMWARE_NAME}; do
        bbnote "Copy ddr_firmware: ${ddr_firmware} from ${DEPLOY_DIR_IMAGE} -> ${BOOT_STAGING} "
        cp ${DEPLOY_DIR_IMAGE}/${ddr_firmware}               ${BOOT_STAGING}
    done
    cp ${DEPLOY_DIR_IMAGE}/signed_*_imx8m.bin                ${BOOT_STAGING}
    cp ${DEPLOY_DIR_IMAGE}/u-boot-spl.bin-${MACHINE}         ${BOOT_STAGING}/u-boot-spl.bin
    cp ${DEPLOY_DIR_IMAGE}/${BOOT_TOOLS}/${UBOOT_DTB_NAME}   ${BOOT_STAGING}
    cp ${DEPLOY_DIR_IMAGE}/${BOOT_TOOLS}/u-boot-nodtb.bin-${MACHINE}-${UBOOT_CONFIG} \
                                                             ${BOOT_STAGING}/u-boot-nodtb.bin
    cp ${DEPLOY_DIR_IMAGE}/${BOOT_TOOLS}/mkimage_uboot       ${BOOT_STAGING}
    cp ${DEPLOY_DIR_IMAGE}/${UBOOT_NAME}                     ${BOOT_STAGING}/u-boot.bin
}

do_compile() {
    compile_${SOC_FAMILY}
    # mkimage for i.MX8
    for target in ${IMXBOOT_TARGETS}; do
        bbnote "building ${SOC_TARGET} - ${target}"
        # Use iMX8MM soc, not iMX8M. If dtbs not specified in lower case too
        # mkimage_fit_atf.sh will not use 8mm dtb when generating iMX8MM-2g.its
        # thus booting will fail - imx-mkimage/iMX8M/sok.mak:74
        make SOC=iMX8MM DTBS=${UBOOT_DTB_NAME} dtbs=${UBOOT_DTB_NAME} ${target}
        if [ -e "${BOOT_STAGING}/${target}" ]; then
            cp ${BOOT_STAGING}/${target} ${S}/${BOOT_CONFIG_MACHINE}-${target}
        fi
    done
}

do_compile[depends] += " \
    virtual/bootloader:do_install \
"

# Together with the IMAGE DEPENDS in resin-image
# this triggers signed boot binary generation each time
# there's a change in u-boot, without installing
# imx-boot in the rootfs
do_compile[nostamp] = "1"
