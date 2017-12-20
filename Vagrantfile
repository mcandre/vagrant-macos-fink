Vagrant.configure("2") do |config|
  config.vm.box = "mcandre/macos"
  config.vm.provision "file", source: "patronum.expect", destination: "/Users/vagrant/patronum.expect"
  config.vm.provision "shell", path: "bootstrap.sh", privileged: false
end
