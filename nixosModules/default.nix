{ pkgs, lib, ... }: {
  
  imports = [
    # Programs
    ./programs/vm.nix
    # Hyprland
    ./hyprland/hyprland.nix
    # Services
    ./services/packages.nix
    ./services/fonts.nix
    ./services/pipewire.nix
  ];
}
