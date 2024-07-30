{ config, pkgs, lib, ... }: {
  
  options = {
    zathura.enable = lib.mkEnableOption "enables zathura";
  };

  config = lib.mkIf config.zathura.enable {
    programs.zathura= {
      enable = true;
      package = pkgs.zathura;
    };
  };
}
