Vagrant.configure("2") do |config|

  #
  # Puppet master 5
  #

  config.vm.define :puppet do |puppet|
    puppet.vm.box = "geerlingguy/centos7"
    puppet.vm.hostname = "puppet"
    puppet.vm.provision :shell, :path => "bootstrap.sh"
    puppet.vm.synced_folder "modules/", "/etc/puppet/modules"
    puppet.vm.synced_folder "manifests/", "/etc/puppet/manifests"
    puppet.vm.synced_folder "hiera/", "/etc/puppet/hiera"
    puppet.vm.network :private_network, ip: "192.168.10.2"
  end

  #
  # CI Server - Jenkins
  #

  config.vm.define :ci do |ci|
    ci.vm.box = "geerlingguy/centos7"
    ci.vm.hostname = "ci"
    ci.vm.provision :shell, :path => "bootstrap.sh"
    ci.vm.synced_folder "modules/", "/etc/puppet/modules"
    ci.vm.synced_folder "manifests/", "/etc/puppet/manifests"
    ci.vm.synced_folder "hiera/", "/etc/puppet/hiera"
    ci.vm.network :private_network, ip: "192.168.10.3"
  end

  #
  # Status dashboard - Sensu
  #

  config.vm.define :status do |status|
    status.vm.box = "geerlingguy/centos7"
    status.vm.hostname = "status"
    status.vm.provision :shell, :path => "bootstrap.sh"
    status.vm.synced_folder "modules/", "/etc/puppet/modules"
    status.vm.synced_folder "manifests/", "/etc/puppet/manifests"
    status.vm.synced_folder "hiera/", "/etc/puppet/hiera"
    status.vm.network :private_network, ip: "192.168.10.3"
  end

  #
  # Winblows 2016
  #

  config.vm.define :agent do |agent|
    agent.vm.box = "mwrock/Windows2016"
    agent.vm.hostname = "agent"
    agent.vm.guest = :windows
    agent.windows.halt_timeout = 15
    agent.winrm.username = "vagrant"
    agent.winrm.password = "vagrant"
    agent.vm.network :forwarded_port, guest: 5985, host: 5985
    agent.vm.network :private_network, ip: "192.168.10.4"
    agent.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", 4096]
    end
    agent.vm.provision :shell, :path => "setup.ps1"
end

end
