deviceTypesCommon = require 'resin-device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	slug: 'hummingboard'
	aliases: [ 'cubox-i' ]
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
		machine: 'cubox-i'
		image: 'resin-image'
		fstype: 'resin-sdcard'
		version: 'yocto-jethro'
		deployArtifact: 'resin-image-cubox-i.resin-sdcard'
		compressed: true

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: commonImg.initialization
