Setup on an RPi from OS OX
---

Instructions mostly taken from [here](https://www.raspberrypi.org/documentation/installation/installing-images/mac.md).

### Write the SD card with Debian Jessie (on OS X)

- Download an OS from the above download link
- Insert the SD card in Mac
- `df -h`: see something like:

        /dev/disk2s1

- `diskutil list`: see something like:

        /dev/disk2
           #:                       TYPE NAME                    SIZE       IDENTIFIER
           0:     FDisk_partition_scheme                        *16.1 GB    disk2
           1:             Windows_FAT_32 boot                    58.7 MB    disk2s1
           2:                      Linux                         4.3 GB     disk2s2

- IMPORTANT: Note the one that is the SD card, in this example we swap `<TODO>` with 'disk2' (the others represent your hard-drives, etc)
- `diskutil unmountDisk /dev/<TODO>`
- `sudo dd bs=1m if=2015-09-24-raspbian-jessie.img of=/dev/r<TODO>` to flash it. (swap "TODO" with yours)
  - Note this takes a LONG time (20-50m) with no output
  - When done `diskutil unmountDisk <TODO>` again

### Boot the Pi + enable SSH

- *Configure your keyboard to match the language*, the default is UK. If using with standard english keyboard `@` with print as `"`, to change: `Preferences -> Mouse and Keyboard Settings -> Keyboard Layout -> `

- *Change password of `pi` user*: `passwd` (default is `raspberry`)

- *Expand SD volume*: `sudo raspi-config` + `Expand Filesystem`
- *Enable SSH*: `sudo raspi-config` + `Advanced -> SSH -> Enable`
- *Confirm SSH is listening*: `ifconfig` + search for an ip like `192.168.1.X`, from your computer (on the same LAN as the RPi), do `nc -z 192.168.1.X 22 && echo "is listening"`, if you dont see "is listening" something is wrong, maybe you don't have `nc` installed (which is okay) perhaps you are on a differenet LAN or some firewall is in the way?
- *SSH in*: `ssh pi@192.168.1.X`. Confirm filesystem uses whole SD card: `df -h`
- *Generate ssh keypair*: `ssh-keygen` + `cat ~/.ssh/id_rsa.pub`. Copy that crypto-goo and put somewhere safe; upload it somewhere in GitHub to access your private repos via a deploy key.
- *Enable keyless ssh auth (optional)*: On your machine, `cat ~/.ssh/id_rsa.pub` + add it to `~/.ssh/authorized_keys` on the pi (make sure to `chmod 600 ~/.ssh/authorized_keys` too)
