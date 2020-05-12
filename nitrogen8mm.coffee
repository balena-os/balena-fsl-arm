deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

BOARD_POWEROFF = 'Remove and re-connect power to the board.'
BOARD_SHUTDOWN =  'Monitor the device in Balena dashboard to see when it entered the post-provisioning state. Leave the state settle for around 10 seconds.'

postProvisioningInstructions = [
	BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	instructions.BOARD_REPOWER
]

module.exports =
	version: 1
	slug: 'nitrogen8mm'
	name: 'Nitrogen8M Mini SBC'
	arch: 'aarch64'
	state: 'new'
	private: false

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
		BOARD_POWEROFF
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'https://docs.resin.io/nitrogen8mm-sbc/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/nitrogen8mm-sbc/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/nitrogen8mm-sbc/nodejs/getting-started/#adding-your-first-device'

	supportsBlink: false

	yocto:
		machine: 'nitrogen8mm'
		image: 'resin-image-flasher'
		fstype: 'resinos-img'
		version: 'yocto-thud'
		deployArtifact: 'resin-image-flasher-nitrogen8mm.resinos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
