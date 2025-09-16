#!/bin/bash
# K4m1G1r1 Grimorio: Setup Metasploitable3 Ubuntu 14.04 + VirtualBox + Vagrant

set -e

WORKDIR=~/Labs/VirtualBox/ISO/Metasploitable3
BOXFILE=metasploitable3-ubuntu-14.04.box
BOXNAME=metasploitable3-ub1404
VAGRANTFILE=$WORKDIR/Vagrantfile
VMNAME="Metasploitable3-Ubuntu"

mkdir -p $WORKDIR
cd $WORKDIR

# Download Vagrantfile
curl -O https://raw.githubusercontent.com/rapid7/metasploitable3/master/Vagrantfile

# Add box if missing
if ! vagrant box list | grep -q "$BOXNAME"; then
    vagrant box add $BOXNAME $BOXFILE
fi

# Disable KVM temporarily if active
if lsmod | grep -q kvm; then
    sudo rmmod kvm_amd || true
    sudo rmmod kvm || true
fi

# Edit Vagrantfile IP
sed -i 's/config.vm.network "private_network", ip: ".*"/config.vm.network "private_network", ip: "192.168.56.101"/' $VAGRANTFILE

# Launch VM
vagrant up --provider=virtualbox

# Create snapshot
VBoxManage snapshot "$VMNAME" take "Initial"

echo "✅ Metasploitable3 Ubuntu VM ready!"
