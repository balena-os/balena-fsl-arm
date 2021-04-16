FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

inherit kernel-resin

# Latest known revision as of now is 49cd2d27fefdbaa79f32df96c4672433d9d45590
# and is set in meta-freescale-third-party linux-boundary recipe.

# Disable commit SHA in kernel version string
SCMVERSION="n"

SRC_URI_append = " \
	file://imx8mm-sbc-add-no-cqe-for-eMMC.patch \
"
