# vagrant-macos-fink: a Vagrant box with fink preinstalled

# EXAMPLE

```console
$ vagrant up
$ vagrant ssh -c 'sudo fink -y install fish && fish --version'
fish, version 2.6.0
```

# REQUIREMENTS

* [macOS Vagrant base box](https://github.com/mcandre/packer-templates/tree/master/macos)
* [Vagrant](https://www.vagrantup.com)
* [VMware](https://www.vmware.com)

# EXPORT

```console
$ vagrant package --output vagrant-macos-fink.box
```
