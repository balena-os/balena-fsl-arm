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
	slug: 'imx8mm-lpddr4-evk'
	name: 'NXP i.MX8M Mini LPDDR4 EVK'
	arch: 'aarch64'
	state: 'development'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
		BOARD_POWEROFF
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'https://docs.resin.io/imx8mm-lpddr4-evk/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/imx8mm-lpddr4-evk/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/imx8mm-lpddr4-evk/nodejs/getting-started/#adding-your-first-device'

	yocto:
		machine: 'imx8mm-lpddr4-evk'
		image: 'balena-image-flasher'
		fstype: 'balenaos-img'
		version: 'yocto-honister'
		deployArtifact: 'balena-image-flasher-imx8mm-lpddr4-evk.balenaos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
