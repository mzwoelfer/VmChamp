<div align="center" width="100%">
    <img src="https://user-images.githubusercontent.com/30373916/227715640-22e0fa02-8f17-4fbd-a81d-4a010007972a.png" width="150" />
</div>

<div align="center" width="100%">
    <h2>VmChamp</h2>
    <p>Simple and fast creation of throwaway VMs on your local machine. Connect via SSH seconds.</p>
    <a target="_blank" href="https://github.com/zwoefler/VmChamp/actions"><img src="https://img.shields.io/github/actions/workflow/status/zwoefler/VmChamp/build.yml" /></a>
    <a target="_blank" href="https://github.com/wubbl0rz/VmChamp/stargazers"><img src="https://img.shields.io/github/stars/wubbl0rz/VmChamp" /></a>
    <a target="_blank" href="https://github.com/zwoefler/VmChamp/releases"><img src="https://img.shields.io/github/v/release/zwoefler/VmChamp?display_name=tag" /></a>
    <a target="_blank" href="https://github.com/zwoefler/VmChamp/commits/master"><img src="https://img.shields.io/github/last-commit/zwoefler/VmChamp" /></a>
</div>

## ✨ Features
- Quickly create and SSH into throwaway VMs.
- Fast boot times using minimal cloud images.
- On-demand downloads for `Debian`, `Ubuntu`, `Arch`, `Fedora`, `CentOS`, `Rocky` and `Alma` cloud images.
- Customizable cloud-init commands.
- Utilizes `KVM`, `QEMU`, and `libvirt`.

## 🤔 Why?
`VmChamp` creates local VMs `in seconds` and provides SSH access.

Bypassing a lengthy manual VM setup process.
Especially useful when Containers do not suffice.

## 🚀 Usage
RUN:
```BASH
vmchamp run mytestvm
# or vmchamp run mytestvm --os debian11 --mem 256MB --disk 4GB
```

Which leads to output:
```BASH
️👉 Creating VM: mytestvm
💻 Using OS: Debian11
📔 Memory size: 256 MiB
💽 Disk size: 4 GiB

...output omitted...

⣷ Waiting for network...

...output omitted...

user@testvm:~$
```


## 🛠️ Installation
TESTED on: `Ubuntu 22.04`; `Debian 12`

**🔧 Prerequisites**:
- Linux machine support `virtualization with KVM`
- `KVM`, `QEMU` and `libvirt` installed
- Ensure a default network interface is defined in libvirt, typically named "default."

Check if your cpu supports virtualization:
```BASH
grep -Ec '(vmc|svm)' /proc/cpuinfo
# If the output is greater than 0 your CPU supports hardware virtualization.
```

```BASH
# 1. First, ensure your system is up to date and install the required dependencies:
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system

# 2. Download latest VmChamp:
wget -qO- https://api.github.com/repos/zwoefler/VmChamp/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | wget -i - -O vmchamp

# 3. Install VmChamp
# Make the file executable:
chmod +x vmchamp

# Move vmchamp to your PATH:
# Move to /usr/local/bin that's in your PATH.
# Or rootless install ~/.local/bin:
mkdir -p ~/.local/bin
mv vmchamp ~/.local/bin/

# Ensure ~/.local/bin is in your PATH by adding the following to your ~/.bashrc or ~/.zshrc:
export PATH="$PATH:$HOME/.local/bin"

vmchamp
```

**ISSUES WITH INSTALLATION:**
If your default interface is not started (https://github.com/wubbl0rz/VmChamp/issues/3) try:

```BASH
# use sudo if your user is not in the libvirt group
virsh --connect qemu:///system net-start --network default
virsh --connect qemu:///system net-autostart default
```

---

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

To build **VmChamp** run:

```BASH
./build.sh <version> <output dir>
# ./build.sh 1.2.3 ~/build/
```

Output dir defaults to `./build/`.