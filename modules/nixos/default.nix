{ ... }: {
  
  imports = [
    # Programs
    ./programs/vm.nix
    # Hyprland
    ./hyprland/hyprland.nix
    # Services
    ./services/fonts.nix
    ./services/pipewire.nix
  ];
}
