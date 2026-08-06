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

# Strips non-existent hardware drivers and Xen (which requires them to function)
BALENA_CONFIGS:append:nitrogen8mm = " iommu-smmu"
BALENA_CONFIGS[iommu-smmu] = " \
    CONFIG_ARM_SMMU=n \
    CONFIG_ARM_SMMU_V3=n \
    CONFIG_IOMMU_IO_PGTABLE=n \
    CONFIG_IOMMU_IO_PGTABLE_LPAE=n \
    CONFIG_XEN=n \
"

# Removes common clock routing trees compiled for alternative family chips (Plus, Nano, etc.)
BALENA_CONFIGS:append:nitrogen8mm = " alternative-clocks"
BALENA_CONFIGS[alternative-clocks] = " \
    CONFIG_CLK_IMX8MN=n \
    CONFIG_CLK_IMX8MP=n \
    CONFIG_CLK_IMX8MQ=n \
    CONFIG_CLK_IMX8QXP=n \
"

# Eliminates alternative video processing engines; the i.MX8M Mini exclusively supports the Hantro VPU
BALENA_CONFIGS:append:nitrogen8mm = " multimedia-vpu"
BALENA_CONFIGS[multimedia-vpu] = " \
    CONFIG_MXC_VPU_MALONE=n \
    CONFIG_MXC_VPU_WINDSOR=n \
"

# nitrogen8mm uses an NXP PF8100 PMIC, not Samsung S2MPS/S2MPU
BALENA_CONFIGS:append:nitrogen8mm = " wrong-pmic"
BALENA_CONFIGS[wrong-pmic] = " \
    CONFIG_MFD_SEC_CORE=n \
    CONFIG_REGULATOR_S2MPS11=n \
"

# DRM_IMX_DCSS is i.MX8MQ-only; nitrogen8mm is i.MX8M Mini
BALENA_CONFIGS:append:nitrogen8mm = " wrong-display-controller"
BALENA_CONFIGS[wrong-display-controller] = " \
    CONFIG_DRM_IMX_DCSS=n \
"

# Boots via U-Boot + device tree, not UEFI
BALENA_CONFIGS:append:nitrogen8mm = " no-acpi-efi"
BALENA_CONFIGS[no-acpi-efi] = " \
    CONFIG_ACPI=n \
    CONFIG_EFI=n \
"
