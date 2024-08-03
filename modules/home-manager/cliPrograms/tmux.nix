{ config, pkgs, lib, ... }: {
  
  options = {
    tmux.enable = lib.mkEnableOption "enables tmux";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      # Window index start at 1
      baseIndex = 1; 
      # Change prefix
      prefix = "C-Space";
      # Enable mouse selection
      mouse = true;
      # Add plugins
      plugins = with pkgs; [
        tmuxPlugins.vim-tmux-navigator
        {
          plugin = tmuxPlugins.yank;
          extraConfig = ''
            # set vi-mode
            set-window-option -g mode-keys vi
            # keybindings
            bind-key -T copy-mode-vi v send-keys -X begin-selection
            bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
            bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel 
          '';
        }
        tmuxPlugins.sensible
      ];
      extraConfig = ''
        # Open panes in current directory
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
      '';
    };
  };
}
