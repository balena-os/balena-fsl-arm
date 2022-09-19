# Together with the IMAGE DEPENDS in balena-image
# this triggers signed boot binary generation each time
# there's a change in u-boot, without installing
# imx-boot in the rootfs
do_compile[nostamp] = "1"
