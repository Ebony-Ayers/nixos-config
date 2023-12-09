{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName  = "Ebony-Ayers";
    userEmail = "ebonyayers2718@gmail.com";
    extraConfig = {
      push.default = "current";
      push.autoSetupRemote = true;
      safe.directory = "/etc/nixos";
      advice.addIgnoredFile = false;
    };
  };
}
