# This configuration has everything that hyprland needs to work system wide
{ config, pkgs, lib, ... }: {

  options = {
    docker.enable = lib.mkEnableOption "enables docker";
  };

  config = lib.mkIf config.docker.enable {
    # Enabling docker
    virtualisation.docker = {
      enable = true;
      # extraOptions = "--dns 8.8.8.8 --dns 8.8.4.4";
      # rootless = {
      #   enable = true;
      #   setSocketVariable = true;
      # };
    };

    users.extraGroups.docker.members = [ "b3rrypi" ];

    environment.shellInit = ''
      export PATH="/home/b3rrypi/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:$PATH"
    '';
  };
}
