deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'solidrun-n6g'
	name: 'SolidSense N6G'
	arch: 'armv7hf'
	state: 'new'
	community: true

	supportsBlink: false

	options: [ networkOptions.group]

	yocto:
		machine: 'solidrun-n6g'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-dunfell'
		deployArtifact: 'balena-image-solidrun-n6g.balenaos.img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
