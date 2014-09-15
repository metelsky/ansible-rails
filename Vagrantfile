Vagrant.configure("2") do |config|

  config.vm.box      = "hashicorp/precise64"

  config.vm.hostname = "vagrant-rails"

  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

end
