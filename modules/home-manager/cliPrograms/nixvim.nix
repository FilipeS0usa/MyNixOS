{ self, pkgs, lib, config, ... }: {
  options = {
    nixvim.enable = lib.mkEnableOption "enables nixvim";
  };

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      
      extraPackages = with pkgs; [
        wl-clipboard
        # Packages for Conform Plugin
        black
        ruff
        prettierd
        nodePackages.prettier
        stylua
        codespell
        rubyfmt
      ];
      
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

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
          action = "<cmd>Ex<CR>";
          key = "<leader>pv";
        }
      ];

      plugins = {
        luasnip.enable = true;
        lualine.enable = true;
        nix.enable = true;
        git-conflict.enable = true;
        tmux-navigator.enable = true;
        
        # === VIMTEX ===
        vimtex = {
          enable = true;
          package = pkgs.vimPlugins.vimtex;
          texlivePackage = pkgs.texliveFull;
          settings = {
            toc_config = {
              split_pos = "vert topleft";
              split_width = 40;
            };
            view_method = "zathura";
          };
        };

        # === CONFORM ===
        conform-nvim = {
          enable = true;
          package = pkgs.vimPlugins.conform-nvim;
          settings = {
            formatters_by_ft = {
              lua = [ "stylua" ];
              # Conform will run multiple formatters sequenstially
              python = [ "ruff_fix" "ruff_format" "ruff_organize_imports" ];
              ruby = [ "rubyfmt" ];
              # Use stop_after_first to run only the first available formatter
              javascript = {
                __unkeyed-1 = "prettierd";
                __unkeyed-2 = "prettier";
                stop_after_first = true;
              };
              # Use the "*" filetype to run formatters on all filetypes
              "*" = [ "codespell" "prettier"];
            };
            format_on_save = {
              lsp_format = "fallback";
            };
          };
        };

        # === TELESCOPE ===
        web-devicons.enable = true;
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

        # === LSP ===
        lsp = {
         enable = true;
         servers = {
           lua_ls.enable = true;
           pylsp.enable = true;
           nixd.enable = true;
           ruby_lsp = {
             enable = true;
             autostart = true;
           };
           # sqls.enable = true;
           texlab.enable = true;
           # jsonls.enable = true;
           # html.enable = true;
           # cssls.enable = true;
           bashls.enable = true;
           ansiblels.enable = true;
           java_language_server.enable = true;
           dockerls.enable = true;
           docker_compose_language_service.enable = true;
         };
        };

        # === CMP-NVIM (Now called only CMP) ===
        # cmp-buffer.enable = true;
        # cmp-path.enable = true;
        # cmp-nvim-lsp.enable = true;
        # cmp-nvim-lua.enable = true;
        cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            sources = [
              { name = "nvim_lsp"; }
              { name = "path"; }
              { name = "buffer"; }
              { name = "nvim_lua"; }
            ];
            mapping = {
              "<C-k>" = "cmp.mapping.complete()";
              "<C-d>" = "cmp.mapping.scroll_docs(-4)";
              "<C-e>" = "cmp.mapping.close()";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<C-y>" = "cmp.mapping.confirm({ select = true, cmp.ConfirmBehavior.Insert })";
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            };
          };
        };
      };
    };
  };
}
