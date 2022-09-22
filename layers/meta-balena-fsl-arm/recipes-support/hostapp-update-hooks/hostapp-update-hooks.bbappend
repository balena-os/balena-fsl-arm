FILESEXTRAPATHS:append := ":${THISDIR}/files"

HOSTAPP_HOOKS:append:solidrun-imx6 = " \
    99-resin-uboot \
    99-flash-bootloader-solidrun-imx6 \
"

HOSTAPP_HOOKS:append:solidrun-n6g = " \
    99-resin-uboot \
    99-flash-bootloader-solidrun-n6g \
"

HOSTAPP_HOOKS:append:nitrogen6xq2g = " \
    99-resin-uboot \
    99-flash-bootloader-nitrogen6xq2g \
"

HOSTAPP_HOOKS:append:nitrogen8mm = " \
    99-resin-uboot \
    99-flash-bootloader-nitrogen8mm \
"
