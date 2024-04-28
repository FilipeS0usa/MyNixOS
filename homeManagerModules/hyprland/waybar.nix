{ config, pkgs, lib, ... }: {
  
  options = {
    waybar.enable = lib.mkEnableOption "enables waybar";
  };

  config = lib.mkIf config.waybar.enable {
    programs.waybar= {
      enable = true;
      package = pkgs.waybar;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          spacing = 5;
          output = [
            "eDP-1"
            "HDMI-A-1"
          ];
          modules-left = [ "hyprland/workspaces" "wlr/taskbar" ];
          modules-center = [ "hyprland/window" ];
          modules-right = [ "network" "bluetooth" "clock" "memory" "battery" ];

          "battery" = {
            format = "{capacity}% {icon}";
            format-icons = ["" "" "" "" ""];
          };

          "hyprland/workspaces" = {
            format = "{name}: {icon}";
            format-icons = {
              "1" = "";
              "2" = "";
              "3" = "";
              "4" = "";
              "5" = "";
              active = "";
              default = "";
            };
          };
        };
      };
      style = ''
        * {
          border: none;
          border-radius: 0;
          font-family: Source Code Pro;
        }
        window#waybar {
          background: #16191C;
          color: #AAB2BF;
        }
        #workspaces button {
          padding: 0 5px;
        }
      '';
    };
  };
}

