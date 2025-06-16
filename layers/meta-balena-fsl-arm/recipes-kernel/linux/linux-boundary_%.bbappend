FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

inherit kernel-resin

# Latest known revision as of now is 49cd2d27fefdbaa79f32df96c4672433d9d45590
# and is set in meta-freescale-third-party linux-boundary recipe.

# Disable commit SHA in kernel version string
SCMVERSION="n"

SRC_URI:append = " \
	file://imx8mm-sbc-add-no-cqe-for-eMMC.patch \
	file://0001-ARM64-dts-imx8mm-em.dts-Fix-lp55231-LED-driver-probe.patch \
"

BALENA_CONFIGS:append = " optimize-size disable_apparmor"
BALENA_CONFIGS[optimize-size] = " \
    CONFIG_CC_OPTIMIZE_FOR_SIZE=y \
"

BALENA_CONFIGS[disable_apparmor] = " \
    CONFIG_SECURITY_APPARMOR=n \
"

