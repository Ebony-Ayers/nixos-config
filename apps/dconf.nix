{ lib, config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
    "org/gnome/desktop/interface" = {
      enable-hot-corners = false;
      gtk-enable-primary-paste = false;
      color-scheme = "prefer-dark";
      clock-format = "12h";
      clock-show-seconds = true;
    };
    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
    };
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.3;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      click-method = "areas";
      accel-profile = "default";
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 6;
      night-light-schedule-to = 6;
      night-light-temperature = lib.hm.gvariant.mkUint32 4700;
      #night-light-temperature = 4700;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = ["<Super>Tab"];
      switch-applications-backward = ["<Shift><Super>Tab"];
      switch-windows = ["<Alt>Tab"];
      switch-windows-backward = ["<Shift><Alt>Tab"];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "terminal";
      binding = "<Control><Alt>t";
      command = "kgx";
    };
    "org/gnome/calculator" = {
      button-mode = "advanced";
    };
    "org/gnome/shell" = {
      disabled-extensions = ["apps-menu@gnome-shell-extensions.gcampax.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com"];
      enabled-extensions = ["drive-menu@gnome-shell-extensions.gcampax.github.com" "caffeine@patapon.info" "dash-to-dock@micxgx.gmail.com"];
      favorite-apps = ["google-chrome.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Console.desktop" "org.gnome.Calculator.desktop" "discord.desktop"];
    };
    "org/gnome/shell/extensions/caffeine" = {
      show-indicator = "always";
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-position = "BOTTOM";
      show-mounts-only-mounted = true;
      scroll-action = "cycle-windows";
      shift-click-action = "launch";
      click-action = "previews";
      dock-fixed = false;
      show-mounts = false;
      show-trash = false;
    };
  };
}
