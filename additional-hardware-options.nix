{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  
  boot.kernel.sysctl = { "vm.swappiness" = 0; };
  boot.kernelModules = [ "kvm-amd" ];
  
  #additional drives get mounted here
}
