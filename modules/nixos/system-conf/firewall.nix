# This configuration has everything that hyprland needs to work system wide
{ config, pkgs, lib, ... }: {

  options = {
    firewall.enable = lib.mkEnableOption "enables firewall";
  };

  config = lib.mkIf config.firewall.enable {
    # Enable the OpenSSH daemon.
    services.openssh.enable = false;
    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    networking.firewall.enable = true;
  };
}
