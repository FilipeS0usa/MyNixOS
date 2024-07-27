{ config, lib, ... }: {

  options = {
    virtualbox.enable = lib.mkEnableOption "enables virtualbox";
  };

  config = lib.mkIf config.virtualbox.enable {
    virtualisation = {
      virtualbox = {
        host = {
          enable = true;
          enableExtensionPack = true;
        };
        guest = {
          enable = true;
          draganddrop = true;
        };
      };
    };
    users.extraGroups.vboxusers.members = [ "b3rrypi" ];
  };
}
