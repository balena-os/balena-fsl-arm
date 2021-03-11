deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'hummingboard'
	aliases: [ 'solidrun-imx6', 'cubox-i', 'hummingboard', 'hummingboard2' ]
	name: 'Hummingboard'
	arch: 'armv7hf'
	state: 'discontinued'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/hummingboard/nodejs/getting-started/#adding-your-first-device'
		osx: 'http://docs.resin.io/hummingboard/nodejs/getting-started/#adding-your-first-device'
		linux: 'http://docs.resin.io/hummingboard/nodejs/getting-started/#adding-your-first-device'
	supportsBlink: false

	options: [ networkOptions.group ]

	yocto:
		machine: 'solidrun-imx6'
		image: 'balena-image-flasher'
		fstype: 'balenaos-img'
		version: 'yocto-rocko'
		deployArtifact: 'balena-image-flasher-solidrun-imx6.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
