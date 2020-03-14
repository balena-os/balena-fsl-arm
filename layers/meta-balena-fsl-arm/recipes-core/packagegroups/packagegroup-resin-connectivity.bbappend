# Hummingboard platforms have BCM4330 optional WiFi modules
CONNECTIVITY_FIRMWARES_append_solidrun-imx6 = " bcm4330-nvram-config bcm4329-nvram-config linux-firmware-wl18xx ti-bt-firmware"

# the machines in this repo are still on kernel < 4.15 so let's not use wireless-regdb-static just yet
CONNECTIVITY_FIRMWARES_remove = "wireless-regdb-static"
