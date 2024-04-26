{ config, pkgs, lib, ... }: {
  
  options = {
    gtk-qt.enable = lib.mkEnableOption "enables gtk-qt";
  };

  config = lib.mkIf config.gtk-qt.enable {
    home.pointerCursor = {
      gtk.enable = true;
      #size = 16;
      name = "FiraCode";
      size = 13;
    };

    gtk = {
      enable = true;
      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3";
      };
      cursorTheme = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      font = {
        package = pkgs.ubuntu_font_family;
        name = "Ubuntu";
        size = 12;
      };
    };

    qt = {
      enable = true;
      # Platform theme "gtk" or "Gnome"
      platformTheme = "gtk";
      style = {
        package = pkgs.adwaita-qt;
        name = "adwaita-dark";
      };
    };
  };
}

