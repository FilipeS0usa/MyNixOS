# This configuration has everything that hyprland needs to work system wide
{ config, inputs, pkgs, lib, ... }: {

  options = {
    hyprland-de.enable = lib.mkEnableOption "enables hyprland-de";
  };

  config = lib.mkIf config.hyprland-de.enable {

    # Extra packages that I want hyprland to have
    environment.systemPackages = with pkgs; [
      # Hyprland Extras
      hyprpaper
      hyprpicker
      hypridle
      hyprlock
      hyprcursor
    ];

    # Enables hyprland
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };

    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      #NIXOS_OZONE_WL = "1";
    };

    hardware = {
      graphics.enable = true;
    };
  };
}
