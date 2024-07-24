{ config, lib, ... }:
let
  wallpaper_path = /home/b3rrypi/Pictures/Wallpapers/14.png;
in
{
  options = {
    hyprlock.enable = lib.mkEnableOption "enables hyprlock";
  };
  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock= {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 1;
          hide_cursor = false;
        };

        backgroung = [
          {
            path = "${wallpaper_path}";
            blur_passes = 3;
            blur_size = 8;
          }
        ];

        input-field = [
          {
            size = "200, 50";
            position = "0, -80";
            monitor = "";
            dots_center = true;
            fade_on_empty = false;
            font_color = "rgb(202, 211, 245)";
            inner_color = "rgb(91, 96, 120)";
            outer_color = "rgb(24, 25, 38)";
            outline_thickness = 5;
            placeholder_text = "Try to guess MTF...";
            shadow_passes = 2;
          }
        ];
      };
    };
  };
}

