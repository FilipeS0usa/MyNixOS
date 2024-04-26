{ config, pkgs, lib, ... }: {
  
  options = {
    wofi.enable = lib.mkEnableOption "enables wofi";
  };

  config = lib.mkIf config.wofi.enable {
    programs.wofi= {
      enable = true;
      package = pkgs.wofi;

      # General config options
      settings = {
        location = "center";
        allow_markup = true;
        width = 250;
      };

      # css for the window aspect
      style = {
        ''
        * {
          font-family: FiraCode;
        }

        window {
          background-color: #7c818c;
        }
        ''
      };
    };
  };
}

