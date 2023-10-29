FROM ghcr.io/ublue-os/fedora-coreos:stable-zfs

RUN \
        curl -sfL https://get.k3s.io | \
        INSTALL_K3S_SKIP_ENABLE=true \
        INSTALL_K3S_SKIP_START=true \
        INSTALL_K3S_BIN_DIR=/usr/bin \
        sh -s - --disable traefik && \
        ostree container commit
