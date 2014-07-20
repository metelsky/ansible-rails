Vagrant.configure("2") do |config|

  config.vm.box      = "hashicorp/precise64"
  
  config.vm.hostname = "vagrant-rails"
  
  config.vm.network :private_network, ip: "192.168.33.10"
  
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  
  config.vm.synced_folder ".", "/var/www/", 
    id: "vagrant-root",
    owner: "deploy",
    group: "www-data",
    type: "nfs"
  
  # config.vm.provision "shell", path: "bootstrap.sh"
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end
end
