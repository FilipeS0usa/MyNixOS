{ config, pkgs, ... }:

{
  imports = [
    ./../../homeManagerModules/default.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "b3rrypi";
  home.homeDirectory = "/home/b3rrypi";

  # Enable cliPrograms
  git.enable = true;
  nvim.enable = true; 
  kitty.enable = true;
  starship.enable = true;
  bash.enable = true;

  # Enable Desktop Env
  waybar.enable = true;
  
  # Enable hyprland
  # Watch this video https://www.youtube.com/watch?v=zt3hgSBs11g&ab_channel=Vimjoyer
  wayland.windowManager.hyprland = {
    enable = true;
    #package = pkgs.hyprland;
    #xwayland.enable = true;
    #systemd.enable = true;
    systemd.variables = ["--all"];
    plugins = [
      #inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      # "/absolute/path/to/plugin.so"
    ];
    settings = {
      # This is a way to write to the configuration file.
      #"$mod" = "SUPER";
      #bind =
      #  [
      #    "$mod, b, exec, google-chrome"
      #    "$mod, t, exec, kitty"
      #  ]
      #  ++ (
      #    builtins.concatLists (builtins.genList (
      #      x: let
      #        ws = let
      #          c = (x + 1) / 10;
      #        in
      #          builtins.toString (x + 1 - (c * 10));
      #      in [
      #        "$mod, ${ws}, workspace, ${toString (x + 1)}"
      #        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"  
      #      ]
      #      )
      #      10)
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };
    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };
    font = {
      name = "Sans";
      size = 11;
    };
  };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/b3rrypi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
