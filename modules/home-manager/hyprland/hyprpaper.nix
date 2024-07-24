{ ... }: 
let
  wallpaper_path = /home/b3rrypi/Pictures/Wallpapers/14.png;
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = ["${wallpaper_path}"];

      wallpaper = [
        "DP-1, ${wallpaper_path}"
        "DP-2, ${wallpaper_path}"
      ];
    };
  };
}

