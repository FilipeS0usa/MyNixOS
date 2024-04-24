{ pkgs, lib, ... }: {
  
  imports = [
    # Cli Programs
    ./cliPrograms/git.nix
    ./cliPrograms/nvim.nix 
    ./cliPrograms/kitty.nix 
    ./cliPrograms/starship.nix
    ./cliPrograms/bash.nix
    ./cliPrograms/files/files.nix # Place home files of Cli Programs

    # Desktop Environment
    ./hyprland/waybar.nix
    ./hyprland/hyprland.nix
    ./hyprland/files/files.nix # Place home files of Desktop Environment
  ];
}

