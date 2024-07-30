
{ config, lib, ... }: {

  options = {
    extra-hosts.enable = lib.mkEnableOption "enables extra-hosts";
  };

  config = lib.mkIf config.extra-hosts.enable {
    networking.extraHosts =
    ''
        127.0.0.2 other-localhost
        10.0.0.1 server
    '';
  };
}
