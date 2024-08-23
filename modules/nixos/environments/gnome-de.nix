# This configuration has everything that hyprland needs to work system wide
{ config, pkgs, lib, ... }: {

  options = {
    gnome-de.enable = lib.mkEnableOption "enables gnome-de";
  };

  config = lib.mkIf config.gnome-de.enable {
    # Extra packages that I want gnome to have
    environment.systemPackages = with pkgs; [
      gnomeExtensions.blur-my-shell
      gnomeExtensions.forge
      gnomeExtensions.bluetooth-battery
    ];
    services.xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      # Configure keymap in X11
      xkb.layout = "us";
      xkb.variant = "colemak";
    };
  };
}
