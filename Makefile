.PHONY: launch-vm clean-vm clean-boxes clean-vagrant-metadata

launch-vm-virtualbox: Vagrantfile bootstrap.sh
	vagrant up --provider virtualbox

launch-vm-vmware: Vagrantfile bootstrap.sh
	vagrant up --provider vmware_desktop

clean-vm:
	-vagrant destroy -f

clean-box-virtualbox:
	-rm -f vagrant-macos-fink-virtualbox.box

clean-box-vmware:
	-rm -f vagrant-macos-fink-vmware.box

clean-boxes: clean-box-virtualbox clean-box-vmware

clean-vagrant-metadata:
	-rm -rf .vagrant

clean: clean-boxes clean-vm clean-vagrant-metadata

vagrant-macos-fink-virtualbox.box: clean-box-virtualbox clean-vm launch-vm-virtualbox export.Vagrantfile
	vagrant package --output vagrant-macos-fink-virtualbox.box --vagrantfile export.Vagrantfile

vagrant-macos-fink-vmware.box: clean-box-vmware clean-vm launch-vm-vmware export.Vagrantfile
	vagrant package-vmware --output vagrant-macos-fink-vmware.box --vagrantfile export.Vagrantfile

install-box-virtualbox: vagrant-macos-fink-virtualbox.box
	vagrant box add --force --name mcandre/vagrant-macos-fink vagrant-macos-fink-virtualbox.box

install-box-vmware: vagrant-macos-fink-vmware.box
	vagrant box add --force --name mcandre/vagrant-macos-fink vagrant-macos-fink-vmware.box
