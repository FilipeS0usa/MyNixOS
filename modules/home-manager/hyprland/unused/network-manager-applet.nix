{ config, pkgs, lib, ... }: {
  
  options = {
    network-manager-applet.enable = lib.mkEnableOption "enables network-manager-applet";
  };

  config = lib.mkIf config.network-manager-applet.enable {
    services.network-manager-applet= {
      enable = true;
    };
  };
}

