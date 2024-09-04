# 🛠️ Install
TESTED on: `Ubuntu 22.04`; `Debian 12`

### 🔧 Prerequisites:
- Linux machine support `virtualization with KVM`
- `KVM`, `QEMU` and `libvirt` installed
- Ensure a default network interface is defined in libvirt, typically named "default."


### 🚀 INSTALLATION:
1. Check if your cpu supports virtualization:
```BASH
grep -Ec '(vmc|svm)' /proc/cpuinfo
# If the output is greater than 0 your CPU supports hardware virtualization.
```

2. First, ensure your system is up to date and install the required dependencies:
```BASH
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system
```

3. Download latest VmChamp:
```BASH
wget -qO- https://api.github.com/repos/zwoefler/VmChamp/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | wget -i - -O vmchamp
```
4. Install VmChamp
```BASH
# Make the file executable:
chmod +x vmchamp

# Move vmchamp to your PATH:
# Move to /usr/local/bin that's in your PATH.
# Or rootless install ~/.local/bin:
mkdir -p ~/.local/bin
mv vmchamp ~/.local/bin/

# Ensure ~/.local/bin is in your PATH by adding the following to your ~/.bashrc or ~/.zshrc:
export PATH="$PATH:$HOME/.local/bin"
```

5. Run VmChamp
```BASH
vmchamp # Displays help message
```

### ISSUES WITH INSTALLATION:
If your default interface is not started (https://github.com/wubbl0rz/VmChamp/issues/3) try:

```BASH
# use sudo if your user is not in the libvirt group
virsh --connect qemu:///system net-start --network default
virsh --connect qemu:///system net-autostart default
```