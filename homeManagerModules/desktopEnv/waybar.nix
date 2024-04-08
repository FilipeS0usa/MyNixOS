{ config, pkgs, lib, ... }: {
  
  options = {
    waybar.enable = lib.mkEnableOption "enables waybar";
  };

  config = lib.mkIf config.waybar.enable {
    programs.waybar= {
      enable = true;
      package = pkgs.waybar;
    };
  };
}

