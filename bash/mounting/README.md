# Storage Drives and Network Shares

Here are some scripts I use to manage a few Samba shares.

Useful links:
* Linux mounting - https://linoxide.com/howto-mount-smb-filesystem-using-etcfstab/
* Using `smbclient` - https://www.linuxfordevices.com/tutorials/linux/linux-samba
* Configuring drives for NAS - https://jensd.be/913/linux/build-configure-a-linux-based-nas
* Enabling on Windows - https://docs.microsoft.com/en-US/troubleshoot/windows-server/networking/guest-access-in-smb2-is-disabled-by-default

Some challenges:
* Ensure that e.g. `nobody` is a user known to `smbd` via:
`sudo smbpasswd -a nobody`
* Create a sub-directory (e.g. `data`) on a mounted drive and allow
`nobody.nogroup` to own it (use this directory for the share)
