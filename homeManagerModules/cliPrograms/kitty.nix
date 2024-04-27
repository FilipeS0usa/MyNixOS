{ config, pkgs, lib, ... }: {
  options = {
    kitty.enable = lib.mkEnableOption "enables kitty";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      package = pkgs.kitty;
      font = {
        package = pkgs.nerdfonts;
        name = "FiraCode";
        size = 12;
      };
      settings = {
        # Scroll back
        scrollback_lines = 2000;
        wheel_scroll_min_lines = 1;
        # Window settings
        window_padding_width = 4;
        confirm_os_window_close = 0;
        hide_window_decorations = "yes";
        window_margin_width = 2;
        # Border settings
        window_border_width = "0.5pt";
       # active_border_color = "#4d4dff";
       # inactive_border_color = "#008ad8";
        placement_strategy = "center";
        # Background
        background_opacity = "0.85";
        # Hyperlinks
        allow_hyperlinks = "yes";
      };
      extraConfig = ''
        foreground #8b8792
        background #19171c
        color0  #655f6d
        color1  #be4678
        color2  #2a9292
        color3  #aa573c
        color4  #576ddb
        color5  #955ae7
        color6  #398bc6
        color7  #e2dfe7
        color8  #7e7887
        color9  #be4678
        color10 #2a9292
        color11 #a06e3b
        color12 #398bc6
        color13 #955ae7
        color14 #398bc6
        color15 #efecf4
        color16 #19171c
        color17 #bf40bf
        color18 #2a9292
        color19 #aa573c
        color20 #576ddb
        color21 #955ae7
        color22 #398bc6
        color23 #e2dfe7
        cursor  #efecf4
        cursor_text_color #19171c
        selection_foreground #26232a
        selection_background #576ddb
        url_color #398bc6
        active_border_color #7e7887
        inactive_border_color #19171c
        bell_border_color #655f6d
        tab_bar_style fade
        tab_fade 1
        active_tab_foreground   #7e7887
        active_tab_background   #19171c
        active_tab_font_style   bold
        inactive_tab_foreground #efecf4
        inactive_tab_background #be4678
        inactive_tab_font_style bold
        tab_bar_background #19171c
      '';
    };
  };
}

