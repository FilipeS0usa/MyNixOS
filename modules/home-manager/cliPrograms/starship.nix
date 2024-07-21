{ config, pkgs, lib, ... }: {
  
  options = {
    starship.enable = lib.mkEnableOption "enables starship";
  };

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      package = pkgs.starship;
    };
  };
}
