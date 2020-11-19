FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " file://mkfs.hostapp-ubifs"

DEPENDS_append = " mtd-utils-native"

do_compile () {
    rm -rf ${B}/work
    mkdir -p ${B}/work

    cp Dockerfile create mkfs.hostapp-ubifs ${B}/work/
    sed -i "s/@BALENA_STORAGE@/${BALENA_STORAGE}/g" ${B}/work/create
    sed -i "s/@MKUBIFS_ARGS@/${MKUBIFS_ARGS}/g" ${B}/work/create

    IMAGE_ID=$(DOCKER_API_VERSION=1.22 docker build ${B}/work | grep -o -E '[a-z0-9]{12}' | tail -n1)
    DOCKER_API_VERSION=1.22 docker save "$IMAGE_ID" > ${B}/work/mkfs-hostapp-ubifs-image.tar
    DOCKER_API_VERSION=1.22 docker rmi "$IMAGE_ID"

    sed -i "s/@IMAGE@/${IMAGE_ID}/" ${B}/work/mkfs.hostapp-ubifs
}

do_install () {
    install -d ${D}/${bindir}
    install ${B}/work/mkfs.hostapp-ubifs ${D}/${bindir}/

    install -d ${D}/${datadir}
    install ${B}/work/mkfs-hostapp-ubifs-image.tar ${D}/${datadir}/
}
