{ inputs, config, lib, ... }: {
  
  options = {
    nixvim.enable = lib.mkEnableOption "enables nixvim";
  };

  config = lib.mkIf config.nixvim.enable {
    inputs.nixvim.programs.nixvim = {

      enable = true;
      defaultEditor = true;
      
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };

      clipboard.register = "unnamedplus";
      options = {
        number = true;
        relativenumber = true;
        signcolumn = "yes";
        tabstop = 4;
        shiftwidth = 4;
        updatetime = 300;
        termguicolors = true;
        mouse = "a";
      };
      
      keymaps = [
        {
          action = "<cmd>Ex";
          key = "<leader>pv";
        }
      ];

      plugins = {
        luasnip.enable = true;
        oil.enable = true;

        # === TELESCOPE ===
        telescope = {
          enable = true;
          keymaps = {
            "<leader>pf" = {
              action = "find_files";
              desc = "Telescope Files";
            };
            "C-p" = {
              action = "git_files";
              desc = "Telescope Git Files";
            };
            "<leader>ps" = {
              action = "grep_string";
            };
          };
          extensions.fzf-native = {
            enable = true;
            settings = {
              case_mode = "smart_case";
              fuzzy = true;
              override_generic_sorter = true;
              override_file_sorter = true;
            };
          };
        };

        # === TREESITTER ===
        treesitter = {
          enable = true;
          settings = {
            ensure_installed = [];
            auto_install = false;
            highlight = {
              enable = true;
            };
            indent.enable = true;
          };
        };

        # === HARPOON ===
        harpoon = {
          enable = true;
          enableTelescope = true;
          keymaps = {
            addFile = "<leader>a";
            cmdToggleQuickMenu = "<C-e>";
            navFile = {
              "1" = "<C-s>";
              "2" = "<C-t>";
              "3" = "<C-h>";
              "4" = "<C-n>";
            };
          };
        };
        # === FUTURE PLUGINS ===
      };

    }; 
  };
}
