{ config, lib, ... }: {

  options = {
    extra-hosts.enable = lib.mkEnableOption "enables extra-hosts";
  };

  config = lib.mkIf config.extra-hosts.enable {
    networking.extraHosts =
    ''
      10.255.43.134 gitlabserverECD.io
      10.251.220.30 gitlabserver.io
      10.251.220.35 passboltserver.io
      10.251.222.10 vmwareserver.io
    '';
  };
}
