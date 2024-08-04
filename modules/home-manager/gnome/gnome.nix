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
        ];
      };
      # Keybinds to window management
      "org/gnome/desktop/wm/keybindings" = {
        close = ["<Super>w"];
        switch-applications = "disabled";
        move-to-workspace-1 = ["<Shift><Super>1"];
        move-to-workspace-2 = ["<Shift><Super>2"];
        move-to-workspace-3 = ["<Shift><Super>3"];
        move-to-workspace-4 = ["<Shift><Super>4"];
        switch-to-workspace-1 = ["<Super>1"];
        switch-to-workspace-2 = ["<Super>2"];
        switch-to-workspace-3 = ["<Super>3"];
        switch-to-workspace-4 = ["<Super>4"];
        cycle-windows = ["<Super>Tab"];
      };
      # Call Custom keybinds and add another ones
      "org/gnome/settings-daemon/plugins/media-keys" = {
        # Opens the browser
        www = [ "<Super>b" ];
        # Controls media (music, video, etc...)
        next = [ "<Shift><Control>n" ];
        previous = [ "<Shift><Control>p" ];
        play = [ "<Shift><Control>space" ];
        # Calls the custom keybind
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };
      # Custom Keybind to open kitty with tmux
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "kitty super";
        command = "kitty -e tmux";
        binding = "<Super>q";
      };
    };
  };
}

