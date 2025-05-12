#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

pkgs=(
bcc
bcc-tools
fd-find
fish
igt-gpu-tools
intel-gpu-tools
intel-media-driver
libva
libva-utils
python3
python3-pip
ripgrep
smartmontools
unzip
"https://github.com/k3s-io/k3s-selinux/releases/download/v1.6.latest.1/k3s-selinux-1.6-1.coreos.noarch.rpm"
)

rpm-ostree install \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${RELEASE}.noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${RELEASE}.noarch.rpm

rpm-ostree install ${pkgs[*]}

curl -sfL https://get.k3s.io | \
        INSTALL_K3S_SKIP_START=true \
        INSTALL_K3S_SKIP_SELINUX_RPM=true \
        sh -s - \
        --disable=traefik,servicelb \
        --flannel-backend=none \
        --disable-network-policy
