deviceTypesCommon = require 'resin-device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

BOARD_SHUTDOWN_ARTIK = 'The device is performing a shutdown. Please wait until the device is offline in the dashboard and disconnect the power cable.'
SET_JUMPER_SD = 'Set SW2 dip switch to position 1:off, 2:on and then power on the board.'
SET_JUMPER_EMMC = 'Set SW2 dip switch to position 1:off, 2:off.'

module.exports =
	slug: 'artik5'
	aliases: [ 'artik5' ]
	name: 'Samsung Artik 5'
	arch: 'armv7hf'
	state: 'preview'

	stateInstructions:
		postProvisioning: [
			BOARD_SHUTDOWN_ARTIK
			instructions.REMOVE_INSTALL_MEDIA
			SET_JUMPER_EMMC
			instructions.BOARD_REPOWER
		]

	instructions:
		windows: [
			instructions.WINDOWS_DISK_IMAGER_SD
			instructions.EJECT_SD
			instructions.FLASHER_WARNING
			SET_JUMPER_SD
			BOARD_SHUTDOWN_ARTIK
			instructions.REMOVE_INSTALL_MEDIA
			SET_JUMPER_EMMC
			instructions.BOARD_REPOWER
		]
		osx: [
			instructions.OSX_PLUG_SD
			instructions.OSX_UNMOUNT_SD
			instructions.DD_BURN_IMAGE_SD
			instructions.EJECT_SD
			instructions.FLASHER_WARNING
			SET_JUMPER_SD
			BOARD_SHUTDOWN_ARTIK
			instructions.REMOVE_INSTALL_MEDIA
			SET_JUMPER_EMMC
			instructions.BOARD_REPOWER
		]
		linux: [
			instructions.LINUX_DF_SD
			instructions.DD_BURN_IMAGE_SD
			instructions.EJECT_SD
			instructions.FLASHER_WARNING
			SET_JUMPER_SD
			BOARD_SHUTDOWN_ARTIK
			instructions.REMOVE_INSTALL_MEDIA
			SET_JUMPER_EMMC
			instructions.BOARD_REPOWER
		]

	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-Samsung-Artik5.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-Samsung-Artik5.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-Samsung-Artik5.md#on-mac-and-linux'

	supportsBlink: false

	yocto:
		machine: 'artik5'
		image: 'resin-image-flasher'
		fstype: 'resin-sdcard'
		version: 'yocto-jethro'
		deployArtifact: 'resin-image-flasher-artik5.resin-sdcard'

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: commonImg.initialization
