do_deploy:append:nitrogen8mm() {
     cat >> ${D}${sysconfdir}/NetworkManager/NetworkManager.conf <<EOF

[keyfile]
unmanaged-devices=interface-name:p2p*
EOF

}

do_deploy:append:imx8mm-lpddr4-evk() {
     cat >> ${D}${sysconfdir}/NetworkManager/NetworkManager.conf <<EOF

[keyfile]
unmanaged-devices=interface-name:p2p*
EOF

}
