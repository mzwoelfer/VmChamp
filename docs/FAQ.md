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
On creation of the VM **every** `.pub` key inside your  `~/.ssh` directory is added to the `authorized_keys` file in the VM.