{ pkgs, lib, ... }: {
  
  imports = [
    ./programs/vm.nix
    ./hyprland/hyprland.nix
    ./files/files.nix
  ];
}
