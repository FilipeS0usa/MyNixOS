{ config, pkgs, lib, ... }: {

  options = {
    wine.enable = lib.mkEnableOption "enables wine";
  };

  config = lib.mkIf config.wine.enable {
    environment.systemPackage = with pkgs; [
      winetricks
    ];
  };
  
}
