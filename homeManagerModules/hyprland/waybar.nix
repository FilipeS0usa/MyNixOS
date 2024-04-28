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
          spacing = 4;
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

          "network" = {
            format = "{ifname}";
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ifname} ";
            format-disconnected = "";
          };

          "hyprland/workspaces" = {
            on-click = "activate";
            active-only = false;
            all-outputs = true;
            format = "{}";
            format-icons = {
              urgent = "";
              active = "";
              default = "";
            };
            persistent-workspaces = {
              "*" = 4;
            };
          };
        };
      };
      style = ''

        @define-color backgroundlight #FFFFFF;
        @define-color backgrounddark #FFFFFF;
        @define-color workspacesbackground1 #FFFFFF;
        @define-color workspacesbackground2 #CCCCCC;
        @define-color bordercolor #FFFFFF;
        @define-color textcolor1 #000000;
        @define-color textcolor2 #000000;
        @define-color textcolor3 #FFFFFF;
        @define-color iconcolor #FFFFFF;
        
        * {
          border: none;
          border-radius: 0;
          font-family: FiraCode;
        }

        window#waybar {
          background: rgba(0,0,0,0.2);
          border-bottom: 0px solid #ffffff;
          transition-property: background-color;
          transition-duration: .5s;
        }

        #window {
          background: @backgroundlight;
          margin: 10px 15px 10px 0px;
          padding: 2px 10px 0px 10px;
          border-radius: 12px;
          color:@textcolor2;
          font-size: 16px;
          font-weight:normal;
        }

        window#waybar.empty #window {
          background-color:transparent;
        }

        #workspaces {
          margin: 5px 1px 6px 1px;
          padding: 0px 1px;
          border-radius: 15px;
          border: 0px;
          font-weight: bold;
          font-style: normal;
          font-size: 16px;
          color: @textcolor1;
        }

        #workspaces button {
          padding: 0px 5px;
          margin: 4px 3px;
          border-radius: 15px;
          border: 0px;
          color: @textcolor3;
          transition: all 0.3s ease-in-out;
        }

        #workspaces button.active {
          color: @textcolor1;
          background: @workspacebackground2;
          border-radius: 15px;
          min-width: 40px;
          transition: all 0.3s ease-in-out;
        }

        #workspaces button:hover {
          color: @textcolor1;
          background: @workspacebackground2;
          border-radius: 15px;
        }
      '';
    };
  };
}

