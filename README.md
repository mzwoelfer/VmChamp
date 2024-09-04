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
- Shell completion
- Utilizes `KVM`, `QEMU`, and `libvirt`.

## 🤔 Why?
`VmChamp` creates local VMs `in seconds` and provides SSH access.

Bypassing a lengthy manual VM setup process.
Especially useful when Containers do not suffice.

## 🚀 Usage
RUN:
```BASH
vmchamp run mytestvm
# or for more options
vmchamp run mytestvm --os debian11 --mem 256MB --disk 4GB
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
wget -qO- https://api.github.com/repos/zwoefler/VmChamp/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | wget -i - -O vmchamp

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