{ config, lib, ... }: {

  options = {
    extra-hosts.enable = lib.mkEnableOption "enables extra-hosts";
  };

  config = lib.mkIf config.extra-hosts.enable {
    networking.extraHosts =
    ''
      gitlabserverECD 10.255.43.134 gitlabserverECD.io
      gitlabserver 10.251.220.30 gitlabserver.io
      passboltserver 10.251.220.35 passboltserver.io
      vmwareserver 10.251.222.10 vmwareserver.io
    '';
  };
}
