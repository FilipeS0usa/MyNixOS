{ self, pkgs, lib, config, ... }: {
  options = {
    nixvim.enable = lib.mkEnableOption "enables nixvim";
  };

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      
      extraPackages = [pkgs.xclip];
      
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };


      opts = {
        number = true;
        relativenumber = true;
        signcolumn = "yes";
        tabstop = 4;
        shiftwidth = 4;
        updatetime = 300;
        termguicolors = true;
        mouse = "a";
        clipboard = "unnamedplus";
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
          formattersByFt = {
            javascript = [ "prettier" ];
            javascriptreact = [ "prettier" ];
            css = [ "prettier" ];
            html = [ "prettier" ];
            json = [ "prettier" ];
            yaml = [ "prettier" ];
            markdown = [ "prettier" ];
            python = [ "isort" "black" ];
          };
          formatOnSave = {
            lspFallback = true;
            timeoutMs = 500;
          };
        };

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

        # === LSP ===
        lsp = {
         enable = true;
         servers = {
           lua-ls.enable = true;
           pylsp.enable = true;
           nixd.enable = true;
           ruby-lsp = {
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
           java-language-server.enable = true;
           dockerls.enable = true;
           docker-compose-language-service.enable = true;
         };
        };

        # === CMP-NVIM (Now called only CMP) ===
        cmp = {
          enable = true;
          autoEnableSources = true;
          # sources = [
          #   {name = "nvim_lsp";}
          #   {name = "path";}
          #   {name = "buffer";}
          #   {name = "luasnip";}
          # ];

          # mapping = {
          #   "<CR>" = "cmp.mapping.confirm({ select = true })";
          #   "<Tab>" = {
          #     action = ''
          #       function(fallback)
          #         if cmp.visible() then
          #           cmp.select_next_item()
          #         else
          #           fallback()
          #         end
          #       end
          #     '';
          #     modes = [ "i" "s" ];
          #   };
          # };
        };
      };
    };
  };
}
