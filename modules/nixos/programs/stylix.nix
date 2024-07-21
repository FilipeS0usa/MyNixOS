{ config, pkgs, lib, ... }: {

  options = {
    stylix.enable = lib.mkEnableOption "enables stylix";
  };

  config = lib.mkIf config.stylix.enable {
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
    stylix.image = ~/.confi/Wallpapers/02.png;

    # To search for cursor available just do the following commands
    # nix build nixpkgs#bibata-cursors
    # cd result
    # nix run nixpkgs#eza -- --tree --level 3
    # This will give all names of the bibata cursors package available

    stylix.cursor.package = pkgs.bibata-cursors;
    stylix.cursor.name = "Bibata-Modern-Ice";

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
        terminal = 15;
        desktop = 10;
        popups = 10;
    };

    # For programs opacity
    stylix.opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    }; 

    stylix.polarity = "dark";
  };
  
}
