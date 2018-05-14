#!/bin/sh -eux

HOME_DIR="/home/vagrant"

pubkey_url="https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub"
privkey_url="https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant"
mkdir -p "${HOME_DIR}/.ssh"
curl --insecure "$pubkey_url" -o "${HOME_DIR}/.ssh/authorized_keys"
curl --insecure "$privkey_url" -o "${HOME_DIR}/.ssh/id_rsa"
cp ${HOME_DIR}/.ssh/authorized_keys ${HOME_DIR}/.ssh/id_rsa.pub

chmod 600 ${HOME_DIR}/.ssh/id_rsa.pub
chown -R vagrant "${HOME_DIR}/.ssh"
chmod -R go-rwsx "${HOME_DIR}/.ssh"
