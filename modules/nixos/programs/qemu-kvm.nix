{ config, pkgs, lib, ... }: {

  options = {
    qemu-kvm.enable = lib.mkEnableOption "enables qemu-kvm";
  };

  config = lib.mkIf config.qemu-kvm.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
  
}
