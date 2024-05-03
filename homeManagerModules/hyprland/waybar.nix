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
          modules-left = [ "wlr/taskbar" "hyprland/window" ];
          modules-center = [ "hyprland/workspaces" ];
          modules-right = [ "pulseaudio" "bluetooth" "battery" "network" "group/hardware" "tray" "custom/exit" "clock"];

          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            "format-icons" = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" " " " "];
            };
            on-click = "pavucontrol";
          };

          "battery" = {
            "states" = {
              #good = 95;
              warning = 30;
              critical = 15;
            };
            format = "{icon}   {capacity}%";
            format-charging = "  {capacity}%";
            format-plugged = "  {capacity}%";
            format-alt = "{icon}  {time}";
            format-icons = [ " " " " " " " " " " ];
          };

          "bluetooth" = {
            format-disabled = "";
            format-off = "";
            interval = 30;
            on-click = "blueman-manager";
            format-no-controller = "";
          };

          "clock" = {
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d}";
          };

          "custom/system" = {
            format = "";
            tooltip = false;
          };

          "cpu" = {
            format = "/ C {usage}% ";
            on-click = "alacritty -e htop";
          };

          "memory" = {
            format = "/ M {}% ";
            on-click = "alacritty -e htop";
          };

          "disk" = {
            interval = 30;
            format = "D {percentage_used}% ";
            path = "/";
            on-click = "alacritty -e htop";
          };

          "hyprland/language" = {
            format = "/ K {short}";
          };

          "group/hardware" = {
            orientation = "inherit";
            "drawer" = {
              transition-duration = 300;
              children-class = "not-memory";
              transition-left-to-right = false;
            };
            modules = [ "custom/system" "disk" "cpu" "memory" "hyprland/language" ];
          };


          "network" = {
            format = "{ifname}";
            format-wifi = "   {signalStrength}%";
            format-ethernet = "  {ipaddr}";
            format-disconnected = "Not connected"; 
            tooltip-format = " {ifname} via {gwaddri}";
            tooltip-format-wifi = "   {essid} ({signalStrength}%)";
            tooltip-format-ethernet = "  {ifname} ({ipaddr}/{cidr})";
            tooltip-format-disconnected = "Disconnected";
            max-length = 50;
            on-click = "alacritty -e nmtui";
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

          "tray" = {
            spacing = 10;
          };

          "custom/exit" = {
            format = "";
            on-click = "wlogout";
            tooltip = false;
          };

          "idle_inhibitor" = {
            format = "{icon}";
            tooltip = true;
            "format-icons" = {
              activated = "";
              deactivated = "";
            };
            on-click-right = "waylock";
          };
        };
      };
      style = ''
      
      /* -----------------------------------------------------
       * Colors
       * ----------------------------------------------------- */


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

      /* -----------------------------------------------------
       * General 
       * ----------------------------------------------------- */

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

      /* -----------------------------------------------------
       * Taskbar
       * ----------------------------------------------------- */

        #taskbar {
            background: @backgroundlight;
            margin: 6px 15px 6px 0px;
            padding:0px;
            border-radius: 15px;
            font-weight: normal;
            font-style: normal;
            border: 3px solid @backgroundlight;
        }

        #taskbar button {
            margin:0;
            border-radius: 15px;
            padding: 0px 5px 0px 5px;
        }

      /* -----------------------------------------------------
       * Tooltips
       * ----------------------------------------------------- */

        tooltip {
            border-radius: 10px;
            background-color: @backgroundlight;
            opacity:0.8;
            padding:20px;
            margin:0px;
        }

        tooltip label {
            color: @textcolor2;
        }

      /* -----------------------------------------------------
       * Workspaces
       * ----------------------------------------------------- */

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

      /* -----------------------------------------------------
       * Modules
       * ----------------------------------------------------- */

       .modules-left > widget:first-child > #workspaces {
         margin-left: 0;
       }

       .modules-right > widget:last-child > #workspaces {
         margin-right: 0;
       }

      /* -----------------------------------------------------
       * Custom Modules
       * ----------------------------------------------------- */

        #custom-appmenu {
            background-color: @backgrounddark;
            font-size: 16px;
            color: @textcolor1;
            border-radius: 15px;
            padding: 2px 10px 0px 10px;
            margin: 10px 15px 10px 10px;
        }

      /* -----------------------------------------------------
       * Hardware Group
       * ----------------------------------------------------- */

       #disk,#memory,#cpu,#language {
         margin:0px;
         padding:0px;
         font-size:16px;
         color:@iconcolor;
       }

       #language {
         margin-right:10px;
       }

      /* -----------------------------------------------------
       * Clock
       * ----------------------------------------------------- */

       #clock {
         background-color: @backgrounddark;
         font-size: 16px;
         color: @textcolor1;
         border-radius: 15px;
         padding: 2px 10px 0px 10px;
         margin: 10px 15px 10px 0px;
       }

      /* -----------------------------------------------------
       * Pulseaudio
       * ----------------------------------------------------- */

       #pulseaudio {
          background-color: @backgroundlight;
          font-size: 16px;
          color: @textcolor2;
          border-radius: 15px;
          padding: 2px 10px 0px 10px;
          margin: 10px 15px 10px 0px;
        }

        #pulseaudio.muted {
            background-color: @backgrounddark;
            color: @textcolor1;
        }

      /* -----------------------------------------------------
       * Network
       * ----------------------------------------------------- */

        #network {
            background-color: @backgroundlight;
            font-size: 16px;
            color: @textcolor2;
            border-radius: 15px;
            padding: 2px 10px 0px 10px;
            margin: 10px 15px 10px 0px;
        }

        #network.ethernet {
            background-color: @backgroundlight;
            color: @textcolor2;
        }

        #network.wifi {
            background-color: @backgroundlight;
            color: @textcolor2;
        }

      /* -----------------------------------------------------
       * Bluetooth
       * ----------------------------------------------------- */
        
        #bluetooth, #bluetooth.on, #bluetooth.connected {
          background-color: @backgroundlight;
          font-size: 16px;
          color: @textcolor2;
          border-radius: 15px;
          padding: 2px 10px 0px 10px;
          margin: 10px 15px 10px 0px;
        }
       
       #bluetooth.off {
            background-color: transparent;
            padding: 0px;
            margin: 0px;
        }

      /* -----------------------------------------------------
       * Battery
       * ----------------------------------------------------- */

       #battery {
            background-color: @backgroundlight;
            font-size: 16px;
            color: @textcolor2;
            border-radius: 15px;
            padding: 2px 15px 0px 10px;
            margin: 10px 15px 10px 0px;
        }

        #battery.charging, #battery.plugged {
            color: @textcolor2;
            background-color: @backgroundlight;
        }

        @keyframes blink {
            to {
                background-color: @backgroundlight;
                color: @textcolor2;
            }
        }

        #battery.critical:not(.charging) {
            background-color: #f53c3c;
            color: @textcolor3;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

      /* -----------------------------------------------------
       * Custom Exit
       * ----------------------------------------------------- */

        #custom-exit {
            margin: 0px 20px 0px 0px;
            padding:0px;
            font-size:20px;
            color: @iconcolor;
        }

      /* -----------------------------------------------------
       * Idle Inhibator
       * ----------------------------------------------------- */

        #idle_inhibitor {
            margin-right: 15px;
            font-size: 22px;
            font-weight: bold;
            opacity: 0.8;
            color: @iconcolor;
        }

        #idle_inhibitor.activated {
            margin-right: 15px;
            font-size: 20px;
            font-weight: bold;
            opacity: 0.8;
            color: #dc2f2f;
        }

      /* -----------------------------------------------------
       * Tray
       * ----------------------------------------------------- */

        #tray {
            background-color: #2980b9;
        }

        #tray > .passive {
            -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
            -gtk-icon-effect: highlight;
            background-color: #eb4d4b;
        }

      /* -----------------------------------------------------
       * Other
       * ----------------------------------------------------- */

        label:focus {
            background-color: #000000;
        }

        #backlight {
            background-color: #90b1b1;
        }

        #network {
            background-color: #2980b9;
        }

        #network.disconnected {
            background-color: #f53c3c;
        }


      '';
    };
  };
}

