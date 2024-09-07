{ ... }: {
  
  imports = [
    # Programs
    ./programs/docker.nix
    ./programs/qemu-kvm.nix
    ./programs/virtualbox.nix
    ./programs/ssh.nix
    ./programs/steam.nix
    # Services
    ./services/pipewire.nix
    # Storage Optimization
    ./storage-optimization/storage-optimization.nix
    # System wide configuration modules
    ./system-conf/bootloader.nix
    ./system-conf/extras.nix
    ./system-conf/firewall.nix
    ./system-conf/network.nix
    ./system-conf/time-location.nix
    ./system-conf/extra-hosts.nix
    # Sytem environments 
    ./environments/hyprland-de.nix
    ./environments/gnome-de.nix
  ];
}
