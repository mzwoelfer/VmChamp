<div align="center" width="100%">
    <img src="https://user-images.githubusercontent.com/30373916/227715640-22e0fa02-8f17-4fbd-a81d-4a010007972a.png" width="150" />
</div>

<div align="center" width="100%">
    <h2>VmChamp</h2>
    <p>Simple and fast creation of throwaway VMs on your local machine. Connect via SSH in just a few seconds.</p>
    <a target="_blank" href="https://aur.archlinux.org/packages/vmchamp-bin"><img src="https://img.shields.io/aur/version/vmchamp-bin" /></a>
    <a target="_blank" href="https://github.com/wubbl0rz/VmChamp/actions"><img src="https://img.shields.io/github/actions/workflow/status/wubbl0rz/VmChamp/build.yml" /></a>
    <a target="_blank" href="https://github.com/wubbl0rz/VmChamp/stargazers"><img src="https://img.shields.io/github/stars/wubbl0rz/VmChamp" /></a>
    <a target="_blank" href="https://github.com/wubbl0rz/VmChamp/releases"><img src="https://img.shields.io/github/v/release/wubbl0rz/VmChamp?display_name=tag" /></a>
    <a target="_blank" href="https://github.com/wubbl0rz/VmChamp/commits/master"><img src="https://img.shields.io/github/last-commit/wubbl0rz/VmChamp" /></a>
</div>

## ✨ Features
- Quickly create and SSH into throwaway VMs.
- Fast boot times using minimal cloud images.
- On-demand downloads for Debian, Ubuntu, Arch, Fedora, CentOS, and Alma cloud images.
- Shell completion.
- Customizable cloud-init commands.
- Utilizes KVM, QEMU, and libvirt.


## 🤔 Why?
**VmChamp creates local VMs in seconds and provides SSH access**, bypassing the lengthy traditional VM setup process.

Useful when Docker containers do not suffice, such as for:
- loading/unloading kernel modules
- testing grub configs
- low-level networking tasks
- testing/installing systemd unit files
VMs are preferable.


## 🔧 Prerequisites

Your local linux machine needs to support virtualization and KVM must be installed and working.

A default network interface defined in libvirt must be present. Usually it comes with one by default named "default".
If your default interface is not started (https://github.com/wubbl0rz/VmChamp/issues/3) try:

```
# use sudo if your user is not in the libvirt group
virsh --connect qemu:///system net-start --network default
virsh --connect qemu:///system net-autostart default
```

## 🚀 Usage

``` bash
VmChamp run mytestvm
# or VmChamp run mytestvm --os debian11 --mem 256MB --disk 4GB
```

<img src="https://user-images.githubusercontent.com/30373916/227714582-0338020d-6d84-4bd8-b3cd-a753cc19e3fa.png" width="700px">

For shell completion put this in your ~.zshrc:

```
source <(VmChamp --completion zsh)
```

```
Description:

Usage:
  vmchamp [command] [options]

Options:
  --completion <completion>  generate shell completion. (zsh or bash)
  --version                  Show version information
  -?, -h, --help             Show help and usage information

Commands:
  run, start <name>                start a new VM [default: testvm]
  clean, purge                     delete all vms and images
  vmc, vmclean, vpurge             delete all vms without images
  remove, rm <dadnnn>              removes a vm [default: testvm]
  reboot, reset, restart <dadnnn>  force restarts a vm [default: testvm]
  ssh <dadnnn>                     connect to vm via ssh [default: testvm]
  list, ls, ps                     list all existing vms
  images, os                       get a list of all available os images
```

## 🏗️ Build

Simply use the included bash script as follows:

```bash
./build.sh <version> <output dir>
```

For example:

```bash
./build.sh 1.2.3 ~/build/
```

Output dir defaults to `./build/`.
