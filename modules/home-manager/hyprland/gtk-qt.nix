{ config, pkgs, lib, ... }: {
  
  options = {
    gtk-qt.enable = lib.mkEnableOption "enables gtk-qt";
  };

  config = lib.mkIf config.gtk-qt.enable {
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 12;
    };

    gtk = {
      enable = true;
      theme = {
        package = pkgs.orchis-theme;
        name = "orchis-theme";
      };
      cursorTheme = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
      };
      iconTheme = {
        # package = pkgs.nerdfonts;
        # name = "FiraCode";
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      font = {
        package = pkgs.nerdfonts;
        name = "FiraCode";
        size = 12;
      };
    };

    #qt = {
    #  enable = true;
    #  # Platform theme "gtk" or "Gnome"
    #  platformTheme.name = "gtk";
    #  style = {
    #    package = pkgs.adwaita-qt;
    #    name = "adwaita-dark";
    #  };
    #};
  };
}
