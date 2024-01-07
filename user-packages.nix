pkgs:

with pkgs; [
  google-chrome
  (pkgs.python311.withPackages (ppkgs: [
      ppkgs.pyglet
      ppkgs.numpy
      ppkgs.matplotlib
      ppkgs.pillow
      ppkgs.networkx
  ]))
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
  mathematica
  gnomeExtensions.caffeine
  gnomeExtensions.dash-to-dock
  gcc
  gnumake
  cmake
  gdb
  ccache
  spotify
]
