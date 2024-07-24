{ config, pkgs, lib, ... }: {
  
  options = {
    swaylock.enable = lib.mkEnableOption "enables swaylock";
  };

  config = lib.mkIf config.swaylock.enable {
    programs.swaylock= {
      enable = true;
      package = pkgs.swaylock;
      settings = {
          color = "808080";
          font-size = 24;
          indicator-idle-visible = false;
          indicator-radius = 100;
          line-color = "ffffff";
          show-failed-attempts = true;
      };
    };
  };
}

