{ config, pkgs, lib, ... }: {
  options = {
    kitty.enable = lib.mkEnableOption "enables kitty";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      package = pkgs.kitty;
      font.name = "JetBrainsMono Nerd Font";
      font.size = 14;
      settings = {
        scrollback_lines = 2000;
        wheel_scroll_min_lines = 1;
        window_padding_width = 4;
        confirm_os_window_close = 0;
        background_opacity = "0.85";
        hide_window_decorations = "yes";
      };
    };
  };
}

