# This configuration has everything that hyprland needs to work system wide
{ config, pkgs, lib, ... }: {

  options = {
    ssh.enable = lib.mkEnableOption "enables ssh";
  };

  config = lib.mkIf config.ssh.enable {
    programs.ssh = {
      startAgent = true;
      extraConfig = ''
        AddKeysToAgent yes
      '';
    };
  };
}
