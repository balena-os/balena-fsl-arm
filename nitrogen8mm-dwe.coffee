deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

BOARD_FLASHING = 'The device internal storage is now being flashed with BalenaOS, please wait until completed.'
CAPACITOR_DRAIN = 'Remove power from the board and drain the super capacitor completely.'
BOARD_POWERON = 'Connect power to the board.'

postProvisioningInstructions = [
	CAPACITOR_DRAIN
	instructions.REMOVE_INSTALL_MEDIA
	BOARD_POWERON
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
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
		instructions.BOARD_REPOWER
		BOARD_FLASHING
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'https://docs.resin.io/nitrogen8mm-dwe/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/nitrogen8mm-dwe/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/nitrogen8mm-dwe/nodejs/getting-started/#adding-your-first-device'

	supportsBlink: false

	yocto:
		machine: 'nitrogen8mm-dwe'
		image: 'resin-image-flasher'
		fstype: 'resinos-img'
		version: 'yocto-thud'
		deployArtifact: 'resin-image-flasher-nitrogen8mm-dwe.resinos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
