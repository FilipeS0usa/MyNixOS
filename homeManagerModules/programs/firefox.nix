{ config, pkgs, lib, ... }: {
  
  options = {
    firefox.enable = lib.mkEnableOption "enables firefox";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox= {
      enable = true;
      package = pkgs.firefox;
      profiles..search = {
        default = "DuckDuckGo";
        privateDefault = "DuckDuckGo";
        force = true; 
      };
    };
  };
}
