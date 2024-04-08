{ config, pkgs, lib, ... }: {

  options = {
    vm.enable = lib.mkEnableOption "enables vm";
  };

  config = lib.mkIf config.vm.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
  
}
