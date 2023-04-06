PACKAGE_INSTALL:solidrun-n6g += " \
    firmware-imx-sdma-imx6q \
"

PACKAGE_INSTALL:remove:nitrogen8mm = " initramfs-module-recovery initramfs-module-migrate"
PACKAGE_INSTALL:remove = "mdraid"
