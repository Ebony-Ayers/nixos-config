{ lib, config, pkgs, ... }:

{
  imports = [
    ./apps/dconf.nix
    ./apps/vscode.nix
    ./apps/git.nix
  ];
  
  home.username = "ebony";
  home.homeDirectory = "/home/ebony";
  home.stateVersion = "23.11";
  home.packages = import ./user-packages.nix pkgs;
}
