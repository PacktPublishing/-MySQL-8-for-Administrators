#!/bin/sh -eux

yum -y remove gcc cpp kernel-devel kernel-headers

yum -y clean all

# Clean up network interface persistence
rm -f /etc/udev/rules.d/70-persistent-net.rules
mkdir -p /etc/udev/rules.d/70-persistent-net.rules
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules
rm -rf /dev/.udev/

for ndev in $(ls -1 /etc/sysconfig/network-scripts/ifcfg-*)
do
  if [ "$(basename $ndev)" != "ifcfg-lo" ]; then
    sed -i '/^HWADDR/d' "$ndev"
    sed -i '/^UUID/d' "$ndev"
  fi
done
