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
    ./desktopEnv/waybar.nix
    ./desktopEnv/files/files.nix # Place home files of Desktop Environment
  ];
}

