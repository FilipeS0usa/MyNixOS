{ config, pkgs, lib, ... }: {

  options = {
    fonts.enable = lib.mkEnableOption "enables fonts";
  };

  config = lib.mkIf config.fonts.enable {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        (nerdfonts.override { fonts = [ "FiraCode" ]; })
      ]; 

      fontconfig = {
        defaultFonts = {
          monospace = [ "FiraCode" ];
        };
      };
    };
  };
}
