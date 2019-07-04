UBOOT_KCONFIG_SUPPORT="1"
inherit resin-u-boot

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# Use latest revision
SRCREV="85f75fa9e9db29f45ef5fcee0508973f4ad82698"

# resin-u-boot class patch is rebased
SRC_URI_remove = " file://resin-specific-env-integration-kconfig.patch"
SRC_URI_append = " file://nitrogen-resin-specific-env-integration-kconfig.patch"
SRC_URI_append_nitrogen8mm = " \
    file://0001-nitrogen8mm.h-Enable-env-import-and-saveenv.patch \
"
