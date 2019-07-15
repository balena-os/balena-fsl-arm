# Use latest and known to work revision. Otherwise if
# booting fails at some point we won't know what caused it
SRCREV="2bb49a37e1d964eacebb09aa0073048a2bfd26e8"

do_compile() {
    compile_${SOC_FAMILY}
    # mkimage for i.MX8
    for target in ${IMXBOOT_TARGETS}; do
        bbnote "building ${SOC_TARGET} - ${target}"
        # Use iMX8MM soc, not iMX8M. If dtbs not specified in lower case too
        # mkimage_fit_atf.sh will not use 8mm dtb when generating iMX8MM-2g.its
        # thus booting will fail - imx-mkimage/iMX8M/sok.mak:74
        make SOC=iMX8MM  DTBS=${UBOOT_DTB_NAME} dtbs=${UBOOT_DTB_NAME} ${target}
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
