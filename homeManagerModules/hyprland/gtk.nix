{ config, pkgs, lib, ... }: {
  
  options = {
    gtk.enable = lib.mkEnableOption "enables gtk";
  };

  config = lib.mkIf config.gtk.enable {
    home.pointerCursor = {
      gtk.enable = true;
      #package = pkgs.bibata-cursors;
      #name = "Bibata-Modern-Classic";
      #size = 16;
      name = "FiraCode";
      size = 13;
    };

    gtk = {
      enable = true;
      theme = {
        #package = pkgs.flat-remix-gtk;
        #name = "Flat-Remix-GTK-Grey-Darkest";
        name = "FiraCode";
      };
      iconTheme = {
        #package = pkgs.gnome.adwaita-icon-theme;
        #name = "Adwaita";
        name = "FiraCode";
      };
      font = {
        #name = "Sans";
        #size = 11;
        name = "FiraCode";
        size = 11;
      };
  };
}

