# 03 – VirtualBox + Vagrant + Metasploitable3 🖥️

## 1️⃣ Install VirtualBox & Kernel Modules

```bash
sudo dpkg -i virtualbox-7.2_*.deb
sudo /sbin/vboxconfig
```

## 2️⃣ Install Vagrant

```bash
sudo apt install ./vagrant_2.4.9.deb
vagrant --version
```

## 3️⃣ Handle KVM conflict (AMD-V / VT-x)

```bash
lsmod | grep kvm
sudo rmmod kvm_amd
sudo rmmod kvm
```

## 4️⃣ Prepare Metasploitable3

```bash
mkdir ~/Labs/VirtualBox/ISO/Metasploitable3
cd ~/Labs/VirtualBox/ISO/Metasploitable3
curl -O https://raw.githubusercontent.com/rapid7/metasploitable3/master/Vagrantfile
vagrant box add metasploitable3-ub1404 ./metasploitable3-ubuntu-14.04.box
```

- Edit Vagrantfile: set private IP:

```nano
config.vm.network "private_network", ip: "192.168.56.101"
```

## 5️⃣ Launch VM

```bash
vagrant up --provider=virtualbox
VBoxManage snapshot "Metasploitable3-Ubuntu" take "Initial"
```
