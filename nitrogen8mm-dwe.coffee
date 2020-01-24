deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

UNPACK_IMAGE = 'Unzip the image downloaded from the dashboard.'
CONNECT_USB = 'Power on the board, stop booting in u-boot cmdline and connect the USB OTG port to the PC. Issue the following command in u-boot: ums 0 mmc 0'
FLASH_IMAGE = 'Use Balena Etcher to write the unzipped image to the internal storage of device, which is exposed as Mass Storage on the PC.'
CAPACITOR_DRAIN = 'Remove power from the board and drain the super capacitor completely.'
BOARD_POWERON = 'Connect power to the board.'
WRITE_BALENA_UBOOT = 'If board is using a standard uboot, overwrite it with BalenaOS imx-boot in the mmcblk0boot0 partition.'

postProvisioningInstructions = [
	CAPACITOR_DRAIN
	BOARD_POWERON
	WRITE_BALENA_UBOOT
]

module.exports =
	version: 1
	slug: 'nitrogen8mm-dwe'
	name: 'Nitrogen8MM DWE'
	arch: 'aarch64'
	state: 'new'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		UNPACK_IMAGE
		CONNECT_USB
		FLASH_IMAGE
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'https://docs.resin.io/nitrogen8mm-dwe/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/nitrogen8mm-dwe/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/nitrogen8mm-dwe/nodejs/getting-started/#adding-your-first-device'

	supportsBlink: false

	yocto:
		machine: 'nitrogen8mm-dwe'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-thud'
		deployArtifact: 'resin-image-nitrogen8mm-dwe.resinos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
