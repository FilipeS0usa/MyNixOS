{ pkgs, ... }: {

  stylix.enable = true;

  # To search for base16 themes do the following commands
  # nix build nixpkgs#base16-schemes
  # cd result
  # nix run nixpkgs#eza -- --tree
  # This will give all the yaml file names of the themes available

  # To generate from .yaml file
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  # Example for specific colors
  # stylix.base16Scheme = {
    # base 00 = "282828";
    # ...
    # base 0F = "d65d0e";
    #};

  # To generate colors from walpapper
  stylix.image = /home/b3rrypi/.config/Wallpapers/14.png;

  # To search for cursor available just do the following commands
  # nix build nixpkgs#bibata-cursors
  # cd result
  # nix run nixpkgs#eza -- --tree --level 3
  # This will give all names of the bibata cursors package available

  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 23;
  };

  # For selecting Fonts
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };

  # Change font size
  stylix.fonts.sizes = {
      applications = 12;
      terminal = 12;
      desktop = 12;
      popups = 12;
  };

  # For programs opacity
  stylix.opacity = {
    applications = 0.85;
    terminal = 0.85;
    desktop = 0.85;
    popups = 0.85;
  }; 

  stylix.polarity = "dark";

  stylix.targets.chromium.enable = true;

  stylix.targets.console.enable = true;

  stylix.targets.gnome.enable = true;
}
