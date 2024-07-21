{ ... }: {
  
  imports = [
    # Programs
    ./programs/vm.nix
    ./programs/stylix.nix
    # Hyprland
    ./hyprland/hyprland.nix
    # Services
    ./services/fonts.nix
    ./services/pipewire.nix
  ];
}
