{ pkgs, lib, ... }: {
  
  imports = [
    # Programs
    ./programs/vm.nix
    ./programs/wine.nix
    # Hyprland
    ./hyprland/hyprland.nix
    # Services
    ./services/fonts.nix
    ./services/pipewire.nix
  ];
}
