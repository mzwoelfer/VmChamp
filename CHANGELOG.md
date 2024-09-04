# Changelog

## v0.3.0 - 2024-09-04
FEATURE: Add autocompletion for BASH

- Added: Bash autocompletion output
- Update: README, how to add bashcompletion


## v0.2.2 - 2024-09-04
UPDATE: Simplified README

- Removed: Lengthy explanations and useless paragraphs


## v0.2.1 - 2024-09-04
UPDATE: Added Fedora 38, 39 and 40 to VmChamp


## v0.2.0 - 2024-06-30
FIX: VmChamp SSH uses correct user to connect to machine

- Added: Check if user is not default, read from cloudInit.iso file
- Removed: --user option for SSHCommand


## v0.1.0 - 2024-06-30
FEATURE: Added `--user` flag to VM-Creation and SSH command.

- Updated VM creation: Includes user option, with default user if not specified.
- Updated SSH command: Includes user option, with default user if not specified.
- Refactored command handlers to accommodate more than 8 options using `InvocationContext`.


## v0.0.5 - 2023-04-07

- ask to create bridge if virbr0 is not found or not ready
- better build output for .sh file
- fix link ubuntu 22.04
- fix link fedora 36
- add rocky 8 and 9
- add ubuntu 23.04
- dont add additional .qcow2 to downloaded images
- avoid multiple url slashes in download

## v0.0.4 - 2023-04-01

- better message for ssh connect
- fixed alma 8 and 9 image links

##  v0.0.3 - 2023-04-01

- fixes

##  v0.0.2 - 2023-03-29

- cpu cores option
- more distros. arch, fedora, centos, alma
- list command shows more info:
  - vm state
  - cpu cores
  - memory
  - disk used
  - ping interface
