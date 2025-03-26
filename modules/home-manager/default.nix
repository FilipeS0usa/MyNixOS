{ ... }: {
  
  imports = [
    # Cli Programs
    ./cliPrograms/git.nix
    ./cliPrograms/kitty.nix 
    ./cliPrograms/starship.nix
    ./cliPrograms/bash.nix
    ./cliPrograms/nixvim.nix
    ./cliPrograms/zathura.nix
    ./cliPrograms/tmux.nix

    # Programs
    ./programs/firefox.nix
    #./programs/stylix.nix

    # Hyprland
    ./hyprland/hyprland.nix
    ./hyprland/hyprpaper.nix
    ./hyprland/hypridle.nix
    ./hyprland/hyprlock.nix

    # Gnome
    ./gnome-config/gnome-config.nix
  ];
}

