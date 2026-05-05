# Using Local Images with VmChamp

VmChamp supports running your own custom `.qcow2` images via the `--local-image` flag.
This is useful when you need a pre-configured VM that isn't available as a standard cloud image — for example, one with specific packages, configurations, or a custom kernel.

## Required Tools

| Tool | Package | Purpose |
|---|---|---|
| `guestmount` | `libguestfs-tools` | Mounts a `.qcow2` disk image to a local directory without booting a VM |
| `guestunmount` | `libguestfs-tools` | Safely unmounts a previously mounted guest image |
| `virt-customize` | `libguestfs-tools` | Applies changes to a disk image without manually mounting it (alternative workflow) |
| `chroot` | (built-in) | Runs commands inside the mounted guest filesystem as if it were the root |

Install on Debian/Ubuntu:

```shell
sudo apt install libguestfs-tools
```

Install on Fedora/RHEL:

```shell
sudo dnf install libguestfs-tools
```

## Building a Custom Image

The general workflow is:

1. Start with an existing base `.qcow2` cloud image (see [README.md](README.md) for sources).
2. Mount the image and `chroot` into it to install packages or make changes.
3. Unmount the image cleanly.
4. Run it with VmChamp.

### Step-by-step example

```shell
# Mount the image to /mnt
sudo guestmount -a debian12custom.qcow2 -i /mnt

# Temporarily use your host's DNS so package managers work inside the chroot
mv /mnt/etc/resolv.conf /mnt/etc/resolv.conf.old
cp /etc/resolv.conf /mnt/etc/resolv.conf

# Install packages inside the image
chroot /mnt apt-get update
chroot /mnt apt-get install -y wireguard-tools htop git vim

# Run upgrades
chroot /mnt apt-get upgrade -y

# Restore original resolv.conf
mv /mnt/etc/resolv.conf.old /mnt/etc/resolv.conf

# Unmount the image cleanly
sudo guestunmount /mnt
```

> **Note:** `guestmount -i` uses libguestfs inspection to auto-detect the root partition.
> If the image has multiple partitions, you may need to specify `-m /dev/sda1` explicitly instead.

## Running the Image with VmChamp

Once your image is ready, pass its path with `--local-image`:

```shell
vmchamp run --local-image /path/to/debian12custom.qcow2
```

You can combine it with any other `run` flags:

```shell
vmchamp run myvm --local-image /path/to/debian12custom.qcow2 --cpu 2 --mem 2048
```

VmChamp will copy the image into `~/VmChamp/<vmname>/` and boot it directly — no download needed.

## Prerequisites

Make sure the `virbr0` bridge is set up before running any VM. If it isn't, VmChamp will detect this and offer to create it automatically. You can also create `/etc/qemu/bridge.conf` manually with:

```
allow virbr0
```
