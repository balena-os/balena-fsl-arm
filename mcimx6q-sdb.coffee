deviceTypesCommon = require 'resin-device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	slug: 'mcimx6q-sdb'
	aliases: [ 'mcimx6q-sdb' ]
	name: 'mcimx6q-sdb'
	arch: 'armv7hf'
	state: 'released'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-mcimx6q-sdb.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-mcimx6q-sdb.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-mcimx6q-sdb.md#on-mac-and-linux'
	supportsBlink: false

	yocto:
		machine: 'imx6qsabresd'
		image: 'resin-image'
		fstype: 'resin-sdcard'
		version: 'yocto-jethro'
		deployArtifact: 'resin-image-mcimx6q-sdb.resin-sdcard'

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: commonImg.initialization
