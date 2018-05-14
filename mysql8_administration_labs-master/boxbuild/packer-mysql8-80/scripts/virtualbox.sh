#!/bin/sh -eux

HOME_DIR="/home/vagrant"

VER="$(cat ${HOME_DIR}/.vbox_version)"
ISO="VBoxGuestAdditions_${VER}.iso"
mkdir -p /tmp/vbox;
mount -o loop "${HOME_DIR}/${ISO}" /tmp/vbox
sh /tmp/vbox/VBoxLinuxAdditions.run
umount /tmp/vbox;
rm -rf /tmp/vbox;
rm -f "${HOME_DIR}/${ISO}"
