#!/bin/sh -eux

yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm
yum install -y http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm

yum install -y percona-toolkit-3.0.8 percona-xtrabackup-24-2.4.10 sysbench-1.0.14 MySQL-python mysql-utilities

yum install -y --downloadonly \
--disablerepo=mysql57-community \
--enablerepo=mysql80-community \
mysql-community-server-8.0.11-1.el7.x86_64
