# This configuration has everything that hyprland needs to work system wide
{ config, pkgs, lib, ... }: {

  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    # Enable hyprland
    programs.hyprland = {
      enable = true;
    };

    xdg.portal = {
      enable = true;
      config.common.default = "*";
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    # Enable sddm display manager for login prompt
    services.xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "colemak";
      };
      libinput.enable = true;
    };
    
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
      theme = "${import ./pkgs/sddm-sugar-dark.nix { inherit pkgs; }}";
    };

    # Packages for Hyprland
    environment.systemPackages = with pkgs; [
      ## Wallpaper daemon
      swww
      libsForQt5.qt5.qtgraphicaleffects
    ];

    # Enable swaylock to be able to unlock with password
    security.pam.services.swaylock = {
      fprintAuth = false;
    };

  };
}
