{ config, pkgs, lib, ... }: {
  
  options = {
    starship.enable = lib.mkEnableOption "enables starship";
  };

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      package = pkgs.starship;
      settings = {
        format = lib.concatStrings [
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_state"
          "$git_status"
          "$cmd_duration"
          "$line_break"
          "$python"
          "$shlvl"
          "$character"
        ];

        directory = {
          style = "blue";
        };

        # Char to show if the command was successfull or not
        character = {
          success_symbol = "[❯](purple)";
          error_symbol = "[❯](red)";
          vimcmd_symbol = "[❮](green)";
        };

        # Show shell level
        shlvl = {
          disabled = false;
          format = "[[$symbol](blue) $shlvl](purple)";
          symbol = "";
          threshold = 2;
        };

        # Show git branch
        git_branch = {
          format = "[$branch]($style)";
          style = "bright-black";
        };

        # Show git status
        git_status = {
          format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
          style = "cyan";
          conflicted = "​";
          untracked = "​";
          modified = "​";
          staged = "​";
          renamed = "​";
          deleted = "​";
          stashed = "≡";
        };

        # Show git state
        git_state = {
          format = "\([$state( $progress_current/$progress_total)]($style)\) ";
          style = "bright-black";
        };

        # Tell the duration of the program running
        cmd_duration = {
          format = "[$duration]($style) ";
          style = "yellow";
        };

        # Show python virtual env
        python = {
          format = "[$virtualenv]($style) ";
          style = "bright-black";
        };
      };
    };
  };
}
