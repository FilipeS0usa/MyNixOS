# This configuration has everything that hyprland needs to work system wide
{ config, pkgs, lib, ... }: {

  options = {
    network.enable = lib.mkEnableOption "enables network";
  };

  config = lib.mkIf config.network.enable {
    networking = {
      hostName = "b3rryOS-Nix";
      networkmanager.enable = true;
      # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
      # # Configure network proxy if necessary
      # proxy = {
      #   default = "http://user:password@proxy:port/";
      #   noProxy = "127.0.0.1,localhost,internal.domain";
      # };
    };
  };
}
