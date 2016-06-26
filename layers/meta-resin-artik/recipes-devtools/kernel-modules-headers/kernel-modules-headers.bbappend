FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = " file://in_tree_build.patch"
