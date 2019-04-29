deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

NITROGEN6XQ_FLASH1 = 'Boot the board normally and insert the BalenaOS SD-CARD in the secondary SD-CARD slot.'
NITROGEN6XQ_FLASH2 = 'Mount the resin-boot partition and change directory to the mount point. Execute ./u-boot-flash.sh'
NITROGEN6XQ_POST_FLASH = 'Replace the original SD-CARD with the BalenaOS SD-CARD in the primary SD-CARD slot.'

postProvisioningInstructions = [
	instructions.BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	NITROGEN6XQ_POST_FLASH
	instructions.BOARD_REPOWER
]

module.exports =
	version: 1
	slug: 'nitrogen6xq2g'
	aliases: [ 'nitrogen6xq2g' ]
	name: 'Nitrogen 6X Quad 2GB'
	arch: 'armv7hf'
	state: 'discontinued'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
		NITROGEN6XQ_FLASH1
		NITROGEN6XQ_FLASH2
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'http://docs.resin.io/nitrogen6xq2g/nodejs/getting-started/#adding-your-first-device'
		osx: 'http://docs.resin.io/nitrogen6xq2g/nodejs/getting-started/#adding-your-first-device'
		linux: 'http://docs.resin.io/nitrogen6xq2g/nodejs/getting-started/#adding-your-first-device'

	supportsBlink: false

	yocto:
		machine: 'nitrogen6xq2g'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-sumo'
		deployArtifact: 'resin-image-nitrogen6xq2g.resinos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
