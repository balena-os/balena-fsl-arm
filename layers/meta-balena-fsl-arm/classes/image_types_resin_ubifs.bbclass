inherit image_types_resin

#
# Create a raw image that can by written onto a storage device.
#
# RESIN_HOSTAPP_FSTYPE          - filesystem type for the hostapp image used in,
#                                 the final image, currently either ext4
#                                 or ubifs
#
# Partition table:
#
#   +-------------------+
#   |                   |  ^
#   | U-boot paritition |  |
#   |                   |  v
#   +-------------------+
#   |                   |  ^
#   | U-Boot Env        |  |
#   |                   |  v
#   +-------------------+
#   |                   |  ^
#   | Boot partition    |  |
#   |                   |  v
#   +-------------------+
#   |-------------------|
#   ||                 ||  ^
#   || Root partition A||  |
#   ||                 ||  v
#   |-------------------|
#   ||                 ||  ^
#   || Root partition B||  |
#   ||                 ||  v
#   |-------------------|
#   ||                 ||  ^
#   || State partition ||  |
#   ||                 ||  v
#   |-------------------|
#   ||                 ||  ^
#   || Data partition  ||  |
#   ||                 ||  v
#   |-------------------|
#   +-------------------+
#

IMAGE_CMD_resinos-img () {
# Create a multi volume ubi image using ubinize
}

IMAGE_TYPEDEP_hostapp-ubifs = "docker"

do_image_hostapp_ubifs[depends] += " \
    mkfs-hostapp-native:do_populate_sysroot \
    "

IMAGE_CMD_hostapp-ubifs () {
    dd if=/dev/zero of=${RESIN_HOSTAPP_IMG} seek=$ROOTFS_SIZE count=0 bs=1024
    mkfs.hostapp-ubifs -t "${TMPDIR}" -s "${STAGING_DIR_NATIVE}" -i ${RESIN_DOCKER_IMG} -o ${RESIN_HOSTAPP_IMG}
}

do_image_boot_ubifs[depends] += " \
    mtd-utils-native:do_populate_sysroot \
    u-boot:do_deploy \
    virtual/kernel:do_deploy \
"

IMAGE_CMD_boot.ubifs() {
	# Build UBIFS boot image out of resin-boot folder
	mkfs.ubifs -r "${IMAGE_ROOTFS}/${RESIN_BOOT_FS_LABEL}" -o "${IMGDEPLOYDIR}/${IMAGE_NAME}.boot.ubifs" ${MKUBIFS_BOOT_ARGS}
}

# Remove the default ".rootfs." suffix for 'boot.ubifs' images
do_image_boot_ubifs[imgsuffix] = "."
