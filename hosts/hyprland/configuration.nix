# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../nixosModules/default.nix
      inputs.home-manager.nixosModules.default
    ];


  # Enables programs
  vm.enable = true;

  # Enables hyprland
  hyprland.enable = true;

  # Enables services
  pipewire.enable = true;
  fonts.enable = true;

  # Enables Home-Manager
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };

    users."b3rrypi" = {
      imports = [ ./home.nix ];
    };
  };


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "b3rryOS-Nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    #NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.b3rrypi = {
    isNormalUser = true;
    description = "Filipe Silva";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

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
    neofetch
    wget
    git-crypt
    # Tools
    mongodb-compass
    winbox
    keepassxc
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Enabling docker
  virtualisation.docker.enable = true;
  #virtualisation.docker.extraOptions = "--dns 8.8.8.8 --dns 8.8.4.4";
  #virtualisation.docker.rootless = {
  #enable = true;
  #setSocketVariable = true;
  #};
  users.extraGroups.docker.members = [ "b3rrypi" ];
  #users.extraGroups.b3rrypi.members = [ "b3rrypi" ];

  
  networking.extraHosts =
  ''
    10.251.220.30 gitlabserver.io
    10.251.220.35 passboltserver.io
    127.0.0.1  gitlab.example.com
  '';
}
