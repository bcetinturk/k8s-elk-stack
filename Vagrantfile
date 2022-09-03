# -*- mode: ruby -*-
# vi: set ft=ruby :

machines = [
  { "vm_name" => "glusterfs-cluster-1" }
]

Vagrant.configure("2") do |config|

  machines.each do |machine|

    config.vm.define machine["vm_name"] do |vm_config|

      vm_config.vm.box = "ubuntu/focal64"
      vm_config.vm.network "private_network", ip: "192.168.3.10"
      
      vm_config.vm.provider "virtualbox" do |vb|
        vb.name = machine["vm_name"]
        vb.memory = "1024"
        vb.customize [ "createmedium", "--filename", "#{Dir.home}/gluster-storage/#{machine['vm_name']}/gluster.vdi", "--size", "30720" ]
        # vb.customize [ "storagectl", machine["vm_name"], "--name", "SATA controller", "--add", "sata", "--portcount", "1" ]
        vb.customize [ "storageattach", machine["vm_name"], "--storagectl", "SCSI", "--medium", "#{Dir.home}/gluster-storage/#{machine['vm_name']}/gluster.vdi", "--port", "3", "--type", "hdd" ]
      end

      vm_config.vm.provision "shell", path: "mount-disk.sh"

    end

  end

end
