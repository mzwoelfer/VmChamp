<div align="center" width="100%">
    <img src="https://user-images.githubusercontent.com/30373916/227715640-22e0fa02-8f17-4fbd-a81d-4a010007972a.png" width="150" />
</div>

<div align="center" width="100%">
    <h2>VmChamp</h2>
    <p>Simple and fast creation of throwaway VMs on your local machine. Connect via SSH seconds.</p>
    <a target="_blank" href="https://github.com/mzwoelfer/VmChamp/actions"><img src="https://img.shields.io/github/actions/workflow/status/mzwoelfer/VmChamp/build.yml" /></a>
    <a target="_blank" href="https://github.com/wubbl0rz/VmChamp/stargazers"><img src="https://img.shields.io/github/stars/wubbl0rz/VmChamp" /></a>
    <a target="_blank" href="https://github.com/mzwoelfer/VmChamp/releases"><img src="https://img.shields.io/github/v/release/mzwoelfer/VmChamp?display_name=tag" /></a>
    <a target="_blank" href="https://github.com/mzwoelfer/VmChamp/commits/master"><img src="https://img.shields.io/github/last-commit/mzwoelfer/VmChamp" /></a>
</div>

## � Table of Contents
- [✨ Features](#-features)
- [🤔 Why?](#-why)
- [🚀 Usage](#-usage)
- [🔑 How it works](#-how-it-works)
  - [Default VM User & SSH Access](#default-vm-user--ssh-access)
  - [QEMU User Session](#qemu-user-session)
  - [Add Shell Completion](#add-shell-completion)
- [🛠️ Installation](#️-installation)
- [🏗️ Build](#️-build)

## ✨ Features
- Quickly create and SSH into throwaway VMs.
- Fast boot times using minimal cloud images.
- On-demand downloads for `Debian`, `Ubuntu`, `Arch`, `Fedora`, `CentOS`, `Rocky` and `Alma` cloud images.
- Automatically injects your `~/.ssh/*.pub` keys into the VM's `authorized_keys`. for passwordless ssh access.
- Shell completion
- Utilizes `KVM`, `QEMU`, and `libvirt` in the **user session** (`qemu:///session`) — no root required.

## 🤔 Why?
`VmChamp` creates local VMs `in seconds` and provides SSH access.

Bypassing a lengthy manual VM setup process.
Especially useful when Containers do not suffice.


## 🚀 Usage
RUN:
```BASH
vmchamp run mytestvm
# or for more options
vmchamp run mytestvm --os debian11 --mem 512MiB --disk 20GiB
```

> **Defaults:** OS = `Debian13` · Memory = `512MiB` · Disk = `8GiB` · CPUs = `1` · User = `user`
>
> Plain numbers for `--mem` and `--disk` are interpreted as **GiB** (e.g. `--disk 20` → 20 GiB, `--mem 0.5` → 0.5 GiB).
```BASH
vmchamp run mytestvm --os debian11 --mem 0.512 --disk 20
```

Which leads to output:
```BASH
️👉 Creating VM: mytestvm
💻 Using OS: Debian11
📔 Memory size: 512 MiB
💽 Disk size: 20 GiB

...output omitted...

⣷ Waiting for network...

...output omitted...

user@testvm:~$
```

## 🔑 How it works

### Default VM User & SSH Access

Every VM is provisioned via **cloud-init** ([IsoImager.cs](IsoImager.cs)) with:

- A user named **`user`** (override with `--user`).
- All `*.pub` files found in your **`~/.ssh/`** directory are copied into the VM's `authorized_keys` — SSH works immediately without a password.
- The user has **passwordless sudo** (`ALL=(ALL) NOPASSWD:ALL`).

> No SSH password is set by default. See the [FAQ](docs/FAQ.md) for how to set one if needed.

### QEMU User Session

VmChamp runs VMs in the **QEMU/KVM user session** (`qemu:///session`) — no root required.

To list your VMs from the terminal:
```bash
virsh --connect qemu:///session list --all
```

To view them in Virtual Machine Manager: **File → Add Connection → QEMU/KVM user session**.

### Add Shell completion
Add the following to your `.bashrc` or `.zshrc` file
```BASH
# For BASH
source <(vmchamp --completion bash)

# For ZSH
source <(vmchamp --completion zsh)
```


## 🛠️ Installation
TESTED on: `Ubuntu 22.04`; `Debian 12`

For details see [Installation Guide](/docs/Install.md)

**🔧 Prerequisites**:
- Your machine supports `virtualization with KVM`

```BASH
# Installing requirements
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system

# Download latest VmChamp:
wget -qO- https://api.github.com/repos/mzwoelfer/VmChamp/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | wget -i - -O vmchamp

# Install VmChamp rootless
chmod +x vmchamp
mkdir -p ~/.local/bin
mv vmchamp ~/.local/bin/

export PATH="$PATH:$HOME/.local/bin"

vmchamp run testvm
```

## 🏗️ Build

To build **VmChamp** run:

```BASH
./build.sh <version> <output dir>
# ./build.sh 1.2.3 ~/build/
```

Output dir defaults to `./build/`.
