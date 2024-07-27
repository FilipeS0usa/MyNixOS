# This configuration has everything that hyprland needs to work system wide
{ config, pkgs, lib, ... }: {

  options = {
    extras.enable = lib.mkEnableOption "enables extras";
  };

  config = lib.mkIf config.extras.enable {
    # Enable Flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Allow Unfree Packages
    nixpkgs.config.allowUnfree = true;

    # Permitted Insecure Packages
    nixpkgs.config.permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };
}
