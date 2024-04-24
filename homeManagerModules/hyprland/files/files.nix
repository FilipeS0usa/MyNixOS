{ pkgs, config, ... }: {
  #home.file.".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
  home.file.".config/hypr/start.sh".source = ./hypr/start.sh;
  home.file.".config/Wallpapers".source = ./Wallpapers;
}
