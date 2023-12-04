{ lib, config, pkgs, ... }:

{
  imports = [
    ./apps/dconf.nix
    ./apps/vscode.nix
    ./apps/git.nix
  ];
  
  home.username = "ebony";
  home.homeDirectory = "/home/ebony";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    google-chrome
    python311
    gimp
    qgis
    blender
    musescore
    gparted
    discord
    spotify
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnome.gedit
    #mathematica
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
  ];
  
  home.activation.create-folders = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    bash /etc/nixos/create-folders.sh
  '';
}
