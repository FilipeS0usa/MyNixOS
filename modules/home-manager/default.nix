{ ... }: {
  
  imports = [
    # Cli Programs
    ./cliPrograms/git.nix
    ./cliPrograms/kitty.nix 
    ./cliPrograms/starship.nix
    ./cliPrograms/bash.nix
    ./cliPrograms/files/files.nix # Place home files of Cli Programs
    # ./cliPrograms/nvim.nix 
    # ./cliPrograms/experimentation/nixvim.nix

    # Programs
    ./programs/firefox.nix

    # Hyprland
    ./hyprland/gtk-qt.nix
    #./hyprland/hyprland.nix
    ./hyprland/swaylock.nix
    ./hyprland/waybar.nix
    ./hyprland/wofi.nix
    ./hyprland/network-manager-applet.nix
    ./hyprland/dunst.nix
    ./hyprland/files/files.nix # Place home files of Desktop Environment
  ];
}

