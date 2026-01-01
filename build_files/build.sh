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
)

rpm-ostree install \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${RELEASE}.noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${RELEASE}.noarch.rpm

rpm-ostree install ${pkgs[*]}
