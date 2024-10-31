{ config, pkgs, lib, ... }: {

  options = {
    qemu-kvm.enable = lib.mkEnableOption "enables qemu-kvm";
  };

  config = lib.mkIf config.qemu-kvm.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    # Activate Opengl
    hardware.opengl.enable = true;
    # Enable copy and paste
    services = {
      qemuGuest.enable = true;
      spice-vdagentd.enable = true;
    };
  };
  
}
