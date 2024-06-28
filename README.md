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

- Your local Linux machine must support virtualization with KVM installed and working.
- Ensure a default network interface is defined in libvirt, typically named "default."

If your default interface is not started (https://github.com/wubbl0rz/VmChamp/issues/3) try:

```BASH
# use sudo if your user is not in the libvirt group
virsh --connect qemu:///system net-start --network default
virsh --connect qemu:///system net-autostart default
```

## 🚀 Usage

```BASH
VmChamp run mytestvm
# or VmChamp run mytestvm --os debian11 --mem 256MB --disk 4GB
```

```BASH
$ vmchamp run mytestvm
️👉 Creating VM: mytestvm
💻 Using OS: Debian12
📔 Memory size: 512 MiB
💽 Disk size: 8 GiB
Download: https://cloud.debian.org/images/cloud/bookworm/latest/SHA512SUMS

  100% 00:00:00

Download: https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2

  100% 00:00:00

The checksum is good!

⣷ Waiting for network...

🚀 Your VM is ready.
IP: 192.168.22.169
Connect with 'VmChamp ssh user@192.168.22.169'
Linux mytestvm 6.1.0-21-cloud-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.90-1 (2024-05-03) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
```

For shell completion put this in your ~.zshrc:

```
source <(VmChamp --completion zsh)
```

```BASH
Description:

Usage:
  VmChamp [command] [options]

Options:
  --completion <completion>  generate shell completion. (zsh or bash)
  --version                  Show version information
  -?, -h, --help             Show help and usage information

Commands:
  run, start <name>              start a new VM [default: testvm]
  clean, purge                   delete all vms and images
  vmc, vmclean, vpurge           delete all vms without images
  remove, rm <name>              removes a vm [default: testvm]
  reboot, reset, restart <name>  force restarts a vm [default: testvm]
  ssh <name>                     connect to vm via ssh [default: testvm]
  list, ls, ps                   list all existing vms
  images, os                     get a list of all available os images
```

## 🏗️ Build

To build **VmChamp**, use the the included bash script:

```BASH
./build.sh <version> <output dir>
```

For example:

```BASH
./build.sh 1.2.3 ~/build/
```

Output dir defaults to `./build/`.
