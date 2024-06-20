deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

UNPACK_IMAGE = 'Unzip the balenaOS image downloaded from the dashboard.'
CONNECT_USB_UBOOT_SHELL = 'Connect the serial console to your development machine and start minicom (or your favourite serial port communication program). Power on the board, press CTRL+C to stop autoboot and enter the u-boot shell and connect the leftmost USB port to your development PC. Issue the following command in the u-boot shell: ums 1 mmc 0'
CONNECT_USB_UMS_ROOTFS = 'Issue the following command once you are in the u-boot shell: `ums 1 mmc 0`'
FLASH_BALENAOS = 'Use Balena Etcher to write the unzipped image to the internal storage of device, which is exposed as Mass Storage on your development PC. When finished, stop the previous ums command by pressing CTRL + C in minicom.'
FLASH_UBOOT = 'Update the bootloader. You can perform this step in two ways: a) - from your development PC or b) - from the host OS when running balenaOS on your board. If you want to update it from your development PC, you will find the imx-boot binary in the resin-boot partition (1st partition) of the downloaded BalenaOS image. You then need to expose over USB to your development machine the mmcblk0boot0 partition from an u-boot shell on the board with the command: `ums 1 mmc 0.1`. Then on your development machine, make note on the new device node exposed (e.g. /dev/sdX), and flash the bootloader with the command: `sudo dd if=imx-boot of=/dev/sdX seek=33 bs=1024`. To update the bootloader from the host OS you would run the following command: `echo 0 > /sys/block/mmcblk0boot0/force_ro && dd if=/mnt/boot/imx-boot of=/dev/mmcblk0boot0 seek=33 bs=1024`'

postProvisioningInstructions = [
	CONNECT_USB_UBOOT_SHELL
	FLASH_UBOOT
]

module.exports =
	version: 1
	slug: 'emgw3'
	name: 'EM GW 3'
	arch: 'aarch64'
	state: 'new'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		UNPACK_IMAGE
		CONNECT_USB_UBOOT_SHELL
		CONNECT_USB_UMS_ROOTFS
		FLASH_BALENAOS
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'https://docs.resin.io/nitrogen8mm-dwe/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/nitrogen8mm-dwe/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/nitrogen8mm-dwe/nodejs/getting-started/#adding-your-first-device'

	yocto:
		machine: 'emgw3'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-kirkstone'
		deployArtifact: 'balena-image-emgw3.balenaos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
