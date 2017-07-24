deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'nitrogen6x'
	aliases: [ 'nitrogen6x' ]
	name: 'Nitrogen 6X'
	arch: 'armv7hf'
	state: 'released'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/nitrogen6x/nodejs/getting-started/#adding-your-first-device'
		osx: 'http://docs.resin.io/nitrogen6x/nodejs/getting-started/#adding-your-first-device'
		linux: 'http://docs.resin.io/nitrogen6x/nodejs/getting-started/#adding-your-first-device'
	supportsBlink: false

	yocto:
		machine: 'nitrogen6x'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-morty'
		deployArtifact: 'resin-image-nitrogen6x.resinos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
