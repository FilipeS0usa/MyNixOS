
# This configuration has everything that hyprland needs to work system wide
{ config, pkgs, lib, ... }: {

  options = {
    packages.enable = lib.mkEnableOption "enables packages";
  };

  config = lib.mkIf config.packages.enable {
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      # Browsers
      google-chrome
      microsoft-edge-dev
      firefox
      brave
      # Social
      slack
      discord
      teams-for-linux
      # Note taking
      obsidian
      # Cli Tools
      neofetch
      wget
      git-crypt
      # Tools
      mongodb-compass
      winbox
      keepassxc
    ];
  };
}
