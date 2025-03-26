{  pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/nixos
    ];

  # Programs
  qemu-kvm.enable = true;
  docker.enable = true;
  virtualbox.enable = false;
  ssh.enable = true;

  # General System Configs
  ## Bootloader
  bootloader.enable = true;
  ## Network
  network.enable = true;
  ## Timezone/time
  time-location.enable = true; 
  ## Desktop Environment
  hyprland-de.enable = true; 
  ## Sound
  pipewire.enable = true;
  ## FireWall
  firewall.enable = true; 
  ## Extra NixOS Options (ex.: Flake, Allow unfree, ...)
  extras.enable = true;
  ## Optimizations 
  storage-optimization.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.b3rrypi = {
    isNormalUser = true;
    description = "Filipe Silva";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Browsers
    #google-chrome
    #microsoft-edge-dev
    #firefox
    brave
    # Social
    slack
    discord
    teams-for-linux
    # Note taking
    obsidian
    # Cli Tools
    wget
    git
    git-crypt
    neovim
    # Tools
    mongodb-compass
    winbox4
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
