{ self, pkgs, lib, config, ... }: {
  options = {
    nixvim.enable = lib.mkEnableOption "enables nixvim";
  };

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
        enable = true;
        defaultEditor = true;
        
        viAlias = true;
        vimAlias = true;

        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };

        clipboard.register = "unnamedplus";

        opts = {
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

          # === TELESCOPE ===
          telescope = {
            enable = true;
            keymaps = {
              "<leader>pf" = {
                action = "find_files";
              };
              "C-p" = {
                action = "git_files";
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
          lsp = {
            enable = true;
            servers = {
              lua-ls.enable = true;
              pylsp.enable = true;
              tsserver.enable = false; 
              # rust-analyzer = {
              #   enable = true;
              #   installCargo = false;
              # };
            };
          };
        };
      };
    };
}