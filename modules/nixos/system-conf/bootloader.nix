# This configuration has everything that hyprland needs to work system wide
{ config, pkgs, lib, ... }: {

  options = {
    bootloader.enable = lib.mkEnableOption "enables bootloader";
  };

  config = lib.mkIf config.bootloader.enable {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
