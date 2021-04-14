# Use latest and known to work revision. Otherwise if
# booting fails at some point we won't know what caused it
# Below revision is what we've tested on the Dunfell release
SRCREV="6745ccdcf15384891639b7ced3aa6ce938682365"

do_compile[depends] += " \
    virtual/bootloader:do_install \
"

# Together with the IMAGE DEPENDS in balena-image
# this triggers signed boot binary generation each time
# there's a change in u-boot, without installing
# imx-boot in the rootfs
do_compile[nostamp] = "1"
