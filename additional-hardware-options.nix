{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  
  boot.kernel.sysctl = { "vm.swappiness" = 0; };
  
  fileSystems."/disks/2tbSSD" = {
    device = "/dev/disk/by-uuid/9147a272-8603-43f7-a695-dcc5e428e17c";
    fsType = "ext4";
  };
  fileSystems."/shares/shared_data" = {
    device = "//192.168.0.115/ebony";
    fsType = "cifs";
    options = ["credentials=/etc/nixos/smb_password,uid=1000,gid=100,forceuid,forcegid"];
    # or if you have specified `uid` and `gid` explicitly through NixOS configuration,
    # you can refer to them rather than hard-coding the values:
    # options = ["credentials=/etc/nixos/smb-secrets,uid=${config.users.users.<username>.uid},gid=${config.users.groups.<group>.gid}"];
  };
}
