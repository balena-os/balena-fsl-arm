PACKAGE_INSTALL:solidrun-n6g += " \
    firmware-imx-sdma-imx6q \
"

PACKAGE_INSTALL:remove:nitrogen8mm = " initramfs-module-recovery"
PACKAGE_INSTALL:remove:nitrogen8mm = " initramfs-module-migrate"

PACKAGE_INSTALL:remove = "mdraid"

# increase the allowed initramfs size
IMAGE_ROOTFS_MAXSIZE:imx8mm-lpddr4-evk = "51200"
