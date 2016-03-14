FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = " \
    file://0001-add-gcc5-support.patch \
    file://0002-use-gcc-inline-version.patch \
    "

inherit kernel-resin
