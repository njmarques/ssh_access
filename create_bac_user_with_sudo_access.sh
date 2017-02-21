#!/usr/bin/env bash

MY_SHELL=$( which bash )

/usr/sbin/useradd -c 'Brian Carlsen <bcarlsen at westcoastinformatics.com>' -s ${MY_SHELL} -m bac
cat >/etc/sudoers.d/bac-ALL <<EOF
bac     ALL=(ALL:ALL) NOPASSWD: ALL
EOF
chmod 0440 /etc/sudoers.d/bac-ALL
mkdir ~bac/.ssh
chmod 700 ~bac/.ssh
curl https://raw.githubusercontent.com/njmarques/ssh_access/master/nmarques_rsa.pub >~bac/.ssh/authorized_keys
chmod 400 ~bac/.ssh/authorized_keys
chown -R bac ~bac/.ssh
