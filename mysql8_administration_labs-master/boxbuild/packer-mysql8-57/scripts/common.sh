#!/bin/sh -eux

yum install -y epel-release

yum install -y bzip2 kernel-devel-$(uname -r) kernel-headers-$(uname -r) make gcc perl glibc-devel libgcomp
yum install -y socat tmux vim yum-utils sysstat nc telnet
