{ config, lib, ... }: {
  options = {
    hypridle.enable = lib.mkEnableOption "enables hypridle";
  };
  config = lib.mkIf config.hyprland.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "hyprlock";
        };
        listener = [
          {
            timeout = 900;
            on-timeout = "hyprlock";
          }
          {
            timeout = 1200;
            on-timeout = "hyprctl dispatch dmps off";
            on-resume= "hyprctl dispatch dmps on";
          }
        ];
      };
    };
  };
}

