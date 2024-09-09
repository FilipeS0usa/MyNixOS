# This config had inspiration from this post:
# https://heywoodlh.io/nixos-gnome-settings-and-keyboard-shortcuts
# Also to be able to search for the correct key values I used this command:
# gsettings list-recursively org.gnome.desktop.wm.keybindings
{ config, lib, ... }: {
  options = {
    gnome-config.enable = lib.mkEnableOption "enables gnome-config";
  };
  config = lib.mkIf config.gnome-config.enable {
    dconf.settings = {
      # General configurations
      "org/gnome/shell" = {
        enabled-extensions = [
          "proton-vpn@fthx"
          "system-monitor@gnome-shell-extensions.gcampax.github.com"
          "forge@jmmaranan.com"
          "blur-my-shell@aunetx"
          "bluetooth-battery@michalw.github.com"
        ];
      };
      # Remove open apps with super and number
      "org/gnome/shell/keybindings" = {
        open-new-window-application-1 = [];
        open-new-window-application-2 = [];
        open-new-window-application-3 = [];
        open-new-window-application-4 = [];
        open-new-window-application-5 = [];
        open-new-window-application-6 = [];
        open-new-window-application-7 = [];
        open-new-window-application-8 = [];
        switch-to-application-1 = [];
        switch-to-application-2 = [];
        switch-to-application-3 = [];
        switch-to-application-4 = [];
        switch-to-application-5 = [];
        switch-to-application-6 = [];
        switch-to-application-7 = [];
        switch-to-application-8 = [];
      };

      # Keybinds to window management
      "org/gnome/desktop/wm/keybindings" = {
        close = ["<Super>w"];
        minimize = [];
        switch-applications = []; 
        move-to-workspace-1 = ["<Shift><Super>1"];
        move-to-workspace-2 = ["<Shift><Super>2"];
        move-to-workspace-3 = ["<Shift><Super>3"];
        move-to-workspace-4 = ["<Shift><Super>4"];
        move-to-workspace-5 = ["<Shift><Super>5"];
        move-to-workspace-6 = ["<Shift><Super>6"];
        move-to-workspace-7 = ["<Shift><Super>7"];
        move-to-workspace-8 = ["<Shift><Super>8"];
        switch-to-workspace-1 = ["<Super>1"];
        switch-to-workspace-2 = ["<Super>2"];
        switch-to-workspace-3 = ["<Super>3"];
        switch-to-workspace-4 = ["<Super>4"];
        switch-to-workspace-5 = ["<Super>5"];
        switch-to-workspace-6 = ["<Super>6"];
        switch-to-workspace-7 = ["<Super>7"];
        switch-to-workspace-8 = ["<Super>8"];
        cycle-windows = ["<Super>Tab"];
      };

      # Call Custom keybinds and add another ones
      "org/gnome/settings-daemon/plugins/media-keys" = {
        # Opens the browser
        www = [ "<Super>b" ];
        # Super+I instead of Super+L
        screensaver = [ "<Super>i" ];
        # Controls media (music, video, etc...)
        # next = [ "<Shift><Control>n" ];
        # previous = [ "<Shift><Control>p" ];
        # play = [ "<Shift><Control>space" ];
        # Calls the custom keybind
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };

      # Set number of default workspaces
      "org/gnome/desktop/wm/preferences" = { 
        num-workspaces = 8;
      };

      # Custom Keybinds to open kitty with tmux
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "kitty super";
        command = "kitty";
        binding = "<Super>q";
      };
    };
  };
}

