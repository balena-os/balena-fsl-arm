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
	mkfs.ubifs -r "${IMAGE_ROOTFS}/${RESIN_BOOT_FS_LABEL}" -o "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.boot.ubifs" ${MKUBIFS_BOOT_ARGS}
}

# Remove the default ".rootfs." suffix for 'boot.ubifs' images
do_image_boot_ubifs[imgsuffix] = "."

IMAGE_TYPEDEP_resinos-img += "boot.ubifs"
IMAGE_CMD_resinos-img () {
    # Create a multi volume ubi image using ubinize
    cat << EOF > "${WORKDIR}/ubi.cfg"
[resin-boot]
mode=ubi
image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.boot.ubifs
vol_id=1
vol_size=${RESIN_BOOT_SIZE}KiB
vol_type=dynamic
vol_name=resin-boot

[resin-rootA]
mode=ubi
image=${RESIN_HOSTAPP_IMG}
vol_id=2
vol_size=${RESIN_ROOT_SIZE}KiB
vol_type=dynamic
vol_name=resin-rootA

[resin-rootB]
mode=ubi
vol_id=3
vol_size=${RESIN_ROOT_SIZE}KiB
vol_type=dynamic
vol_name=resin-rootB

[resin-state]
mode=ubi
vol_id=4
vol_size=${RESIN_STATE_SIZE}KiB
vol_type=dynamic
vol_name=resin-state

[resin-data]
mode=ubi
image=${DEPLOY_DIR_IMAGE}/resin-data.ubifs
vol_id=5
vol_type=dynamic
vol_name=resin-data
EOF
    ubinize ${UBINIZE_ARGS} -o "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.resinos-img" "${WORKDIR}/ubi.cfg"
}

