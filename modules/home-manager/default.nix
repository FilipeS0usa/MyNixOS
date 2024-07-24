{ ... }: {
  
  imports = [
    # Cli Programs
    ./cliPrograms/git.nix
    ./cliPrograms/kitty.nix 
    ./cliPrograms/starship.nix
    ./cliPrograms/bash.nix
    ./cliPrograms/files/files.nix # Place home files of Cli Programs
    ./cliPrograms/nixvim.nix

    # Programs
    ./programs/firefox.nix
    ./programs/stylix.nix

    # Hyprland
    ./hyprland/hyprland.nix
  ];
}

