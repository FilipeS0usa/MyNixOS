{ ... }: {
  
  imports = [
    # Programs
    ./programs/docker.nix
    ./programs/qemu-kvm.nix
    ./programs/virtualbox.nix
    # Services
    ./services/pipewire.nix
    # Storage Optimization
    ./storage-optimization/storage-optimization.nix
    # System wide configuration modules
    ./system-conf/bootloader.nix
    ./system-conf/extras.nix
    ./system-conf/firewall.nix
    ./system-conf/gnome-de.nix
    ./system-conf/network.nix
    ./system-conf/time-location.nix

  ];
}
