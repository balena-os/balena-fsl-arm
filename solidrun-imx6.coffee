deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'hummingboard'
	aliases: [ 'solidrun-imx6', 'cubox-i', 'hummingboard', 'hummingboard2' ]
	name: 'Hummingboard'
	arch: 'armv7hf'
	state: 'released'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-Hummingboard.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-Hummingboard.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-Hummingboard.md#on-mac-and-linux'
	supportsBlink: false

	options: [ networkOptions.group ]

	yocto:
		machine: 'solidrun-imx6'
		image: 'resin-image'
		fstype: 'resin-img'
		version: 'yocto-morty'
		deployArtifact: 'resin-image-solidrun-imx6.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
