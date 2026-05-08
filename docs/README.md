# VmChamp Documentation

Simple and fast creation of throwaway VMs on your local machine. Connect via SSH seconds.

VmChamp allows users to quickly create virtual machines using a command-line interface.
It supports various Linux distributions and utilizes `KVM` (Kernel-based Virtual Machine) for virtualization.

## Defaults

| Setting | Default |
|---|---|
| OS | `Debian13` |
| Memory | `512MiB` |
| Disk | `8GiB` |
| CPUs | `1` |
| Username | `user` |

**Storage units:** plain numbers passed to `--mem` or `--disk` are treated as **GiB** (e.g. `--disk 20` → 20 GiB).

**SSH access:** every `*.pub` file in your `~/.ssh/` directory is automatically injected into the VM's `authorized_keys`. The default user (`user`) also has **passwordless sudo**. See [IsoImager.cs](../IsoImager.cs) for the cloud-init definition.

## How It Works

- **VM Creation:** Users initiate VMs and can customize the settings (OS, Memory, CPUs, etc.).
- **Storage:** All VMs are stored at `~/VmChamp`, which is created upon first using the tool.


## Find OS Versions and Cloud images
Using Cloud and server images for `amd64`/`x86_64` architecture in `.qcow2` format.

#### Debian: 
Releases page: https://www.debian.org/releases/

Cloud Images: https://cloud.debian.org/images/cloud/

#### Fedora
Releases: https://download.fedoraproject.org/pub/fedora/linux/releases/

#### Ubuntu:
Cloud Images: https://cloud-images.ubuntu.com/

#### CentOS:
Cloud Images: https://cloud.centos.org/centos/

#### Alma:
Releases: https://raw.repo.almalinux.org/almalinux/

#### Rocky:
Releases: https://download.rockylinux.org/pub/rocky/

#### Arch:
Cloud Images: https://geo.mirror.pkgbuild.com/images/latest/
