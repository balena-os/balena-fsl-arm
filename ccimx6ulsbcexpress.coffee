deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

postProvisioningInstructions = [
	instructions.BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	instructions.BOARD_REPOWER
]

module.exports =
	version: 1
	slug: 'ccimx6ulsbcexpress'
	name: 'Digi ConnectCore 6UL SBC Express'
	arch: 'armv7hf'
	state: 'experimental'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'http://docs.resin.io/dart6ul/nodejs/getting-started/#adding-your-first-device'
		osx: 'http://docs.resin.io/dart6ul/nodejs/getting-started/#adding-your-first-device'
		linux: 'http://docs.resin.io/dart6ul/nodejs/getting-started/#adding-your-first-device'

	supportsBlink: true

	yocto:
		machine: 'ccimx6ulsbcexpress'
		image: 'resin-image'
		fstype: 'ubifs'
		version: 'yocto-thud'
		deployArtifact: 'resin-image-ccimx6ulsbcexpress.boot.ubifs resin-image-ccimx6ulsbcexpress.ubifs'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
