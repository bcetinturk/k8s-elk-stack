#!/bin/bash
grep gluster /etc/fstab
if [ ! $? -eq 0 ]; then
    sudo mkdir /gluster-data
    sudo fdisk /dev/sdc < /vagrant/fdisk-input
    sudo mkfs.ext4 /dev/sdc1
    sudo mount -t ext4 /dev/sdc1 /gluster-data
    echo "/dev/sdc1 /gluster-data ext4 defaults 0 0" | sudo tee -a /etc/fstab
    sudo mount -a
fi
