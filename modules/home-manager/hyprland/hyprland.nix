{ config, pkgs, lib, ... }: 
    let
      startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
        ${pkgs.waybar}/bin/waybar &
        ${pkgs.hyprpaper}/bin/hyprpaper &
        ${pkgs.hypridle}/bin/hypridle&
        ${pkgs.dunst}/bin/dunts &


        sleep 1

        ${pkgs.swww}/bin/swww img ${/home/b3rrypi/Pictures/Wallpapers/14.png} &
      '';
    in
  {
  
  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland.enable {

    imports =
      [ # Include all the Hyprland configurations.
        ./hyprpaper.nix
        ./hypridle.nix
        ./hyprlock.nix
      ];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd = {
        enable = true;
        variables = ["--all"];
      };
      plugins = [
        #inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
        # "/absolute/path/to/plugin.so"
      ];
      settings = {
        # This is a way to write to the configuration file.
        "monitor" = ",preferred,auto,auto";
        # Set start script that initializes bar, etc...
        "exec-once" = ''${startupScript}/bin/start'';

        env = [
          "XCURSOR_SIZE,24"
          "HYPRCURSOR_SIZE,24"
          "QT_QPA_PLATFORMTHEME,qt5ct"
        ];

        input = {
          "kb_layout" = "us";
          "kb_variant" = "colemak";
          "kb_model" = "";
          "kb_options" = "";
          "kb_rules" = "";

          "follow_mouse" = "1";

          touchpad = {
            "natural_scroll" = "no";
          };

          "sensitivity" = "0";
        };

        general = {
          "gaps_in" = "5";
          "gaps_out" = "10";
          "border_size" = "2";
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";

          "layout" = "dwindle";

          "allow_tearing" = "false";
        };

        decoration = {
          "rounding" = "5";

          blur = {
            "enabled" = "true";
            "size" = "3";
            "passes" = "1";
          };

          "drop_shadow" = "yes";
          "shadow_range" = "4";
          "shadow_render_power" = "3";
          "col.shadow" = "rgba(1a1a1aee)";
        };

        animations = {
          "enabled" = "yes";

          "bezier" = "myBezier, 0.05, 0.9, 0.1, 1.05";

          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        dwindle = {
          "pseudotile" = "yes";
          "preserve_split" = "yes";
        };

        master = {
          "new_is_master" = "true";
        };

        gestures = {
          "workspace_swipe" = "off";
        };

        misc = {
          force_default_wallpaper = "-1"; # Set to 0 or 1 to disable to anime mascot wallpapers
        };

        # Example per-device config
        device = {
          "name" = "epic-mouse-v1";
          "sensitivity" = "-0.5";
        };

        "windowrulev2" = "suppressevent maximize, class:.*";

        "$mainMod" = "SUPER";
        "$terminal" = "kitty";
        "$menu" = "rofi-wayland";
        
        # Move/resize windows with mainmod + LMB/RMB and dragging 
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        bind = [
              # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
              "$mainMod, Q, exec, $terminal"
              "$mainMod, C, killactive, "
              "$mainMod, M, exit, "
              "$mainMod, E, exec, $fileManager"
              "$mainMod, V, togglefloating, "
              "$mainMod, R, exec, $menu"
              "$mainMod, P, pseudo, # dwindle"
              "$mainMod, J, togglesplit, # dwindle"
              "$mainMod, B, exec, google-chrome-stable"

              # Move focus with mainMod + arrow keys
              "$mainMod, left, movefocus, l"
              "$mainMod, right, movefocus, r"
              "$mainMod, up, movefocus, u"
              "$mainMod, down, movefocus, d"

              # Switch workspaces with mainMod + [0-9]
              "$mainMod, 1, workspace, 1"
              "$mainMod, 2, workspace, 2"
              "$mainMod, 3, workspace, 3"
              "$mainMod, 4, workspace, 4"
              "$mainMod, 5, workspace, 5"
              "$mainMod, 6, workspace, 6"
              "$mainMod, 7, workspace, 7"
              "$mainMod, 8, workspace, 8"
              "$mainMod, 9, workspace, 9"
              "$mainMod, 0, workspace, 10"

              # Move active window to a workspace with mainMod + SHIFT + [0-9]
              "$mainMod SHIFT, 1, movetoworkspace, 1"
              "$mainMod SHIFT, 2, movetoworkspace, 2"
              "$mainMod SHIFT, 3, movetoworkspace, 3"
              "$mainMod SHIFT, 4, movetoworkspace, 4"
              "$mainMod SHIFT, 5, movetoworkspace, 5"
              "$mainMod SHIFT, 6, movetoworkspace, 6"
              "$mainMod SHIFT, 7, movetoworkspace, 7"
              "$mainMod SHIFT, 8, movetoworkspace, 8"
              "$mainMod SHIFT, 9, movetoworkspace, 9"
              "$mainMod SHIFT, 0, movetoworkspace, 10"

              # Example special workspace (scratchpad)
              "$mainMod, S, togglespecialworkspace, magic"
              "$mainMod SHIFT, S, movetoworkspace, special:magic"

              # Scroll through existing workspaces with mainMod + scroll
              "$mainMod, mouse_down, workspace, e+1"
              "$mainMod, mouse_up, workspace, e-1"

              "$mainMod, S, exec, rofi -show drun -show-icons"
          ];
      };
    };
  };
}

