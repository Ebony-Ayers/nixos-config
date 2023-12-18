{ lib, config, pkgs, ... }:

{
  imports = [
    ./apps/dconf.nix
    ./apps/vscode.nix
    ./apps/git.nix
    /home/ebony/options.nix
  ];
  
  home.username = "ebony";
  home.homeDirectory = "/home/ebony";
  home.stateVersion = "23.11";
  home.packages = import ./user-packages.nix pkgs;
  
  home.activation.create-folders = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    bash /etc/nixos/create-folders.sh fast-storage=/disks/2tbSSD slow-storage=/shares/shared_data
  '';
}
