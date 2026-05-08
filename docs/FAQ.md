# Frequently Asked Questions


### How to fix `libvirt: Domain error : invalid domain pointer in virDomainDestroy`?
The `qemu-bridge-helper` must run with elevated privileges.
To avoid using sudo, set the `setuid bit` on the file:

```BASH
sudo chmod u+s /usr/lib/qemu/qemu-bridge-helper
```

**Explanation**:
Setting the `setuid bit` on an executable runs the file with the permissions of the owner (root), rather than the user (you) who runs the executable.
The `qemu-bridge-helper` must run with elevated privileges to configure network interfaces.
This sets up a network bridge that connects the virtual machines to the physical network.

### Where are the downloaded VM-Images stored?
```BASH
~/VmChamp/default/cache/
```

On first run, the folder `~/VmChamp/default` is created.

### How does VmChamp create the SSH connection?
On creation of the VM **every** `.pub` key inside your `~/.ssh` directory is added to the `authorized_keys` file in the VM.

The default user is **`user`** and has **passwordless sudo** (`ALL=(ALL) NOPASSWD:ALL`). This is configured via cloud-init in [IsoImager.cs](../IsoImager.cs).

You can override the username with `--user <name>` when running `vmchamp run`.

### How to set a password for the VM user?

If you need a password use the `--cmd` option to set it after the VM boots:
```shell
vmchamp run --cmd 'echo "user:MySecurePassword" | sudo chpasswd'
```

Replace `user` with the actual username in the VM (default: `user`) and `MySecurePassword` with your desired password.

> `VmChamp` does not have a `--password` flag. Passwords are intentionally omitted in favour of cloud-init SSH key injection (see above). 


> **Note:** Avoid using simple or reused passwords in VMs that are network-accessible!

### Why is the VM disk larger than the value I passed to `--disk`?

If the value you pass to `--disk` is smaller than the cloud images required minimum disk space, VmChamp will silently expand the disk to meet the image's requirement.

For example, the `Alma 9` cloud image requires `10 GB`, so `--disk 4GB` will still result in a 10 GB disk.

This is expected behaviour, the `--disk` value is effectively a lower bound.