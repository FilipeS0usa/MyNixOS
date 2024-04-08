{ config, pkgs, lib, ... }: {
  
  options = {
    nvim.enable = lib.mkEnableOption "enables nvim";
  };

  config = lib.mkIf config.nvim.enable {
    programs.neovim = 
    let 
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;
      defaultEditor = true;
      
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins; [
        
        vim-be-good
        
        # Theme
        rose-pine

        #  ===== LSP SECTION =====
       
       #{
        #  plugin = nvim-lspconfig;
        #  config = toLuaFile ./files/nvim/plugin/lsp.lua;
        #}

        neodev-nvim # Faz uma autoconfiguração de language servers
        
        # autocompletion
        #nvim-cmp
        #cmp_luasnip
        #cmp-nvim-lsp

        #luasnip
        #friendly-snippets
        # ======= END =======

        # Make it prettier
        lualine-nvim
        nvim-web-devicons

        # Fuzzy Finder
        telescope-nvim
        telescope-fzf-native-nvim

        {
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";	
        }

        # Treesitter
        nvim-treesitter.withAllGrammars
        
        vim-nix

        harpoon
        
      ];

      extraLuaConfig = '' 
        ${builtins.readFile ./files/nvim/options.lua}
        ${builtins.readFile ./files/nvim/plugin/harpoon.lua}
        ${builtins.readFile ./files/nvim/plugin/rosepine.lua}
        ${builtins.readFile ./files/nvim/plugin/telescope.lua}
        ${builtins.readFile ./files/nvim/plugin/lualine.lua}
        ${builtins.readFile ./files/nvim/plugin/treesitter.lua}
      '';
      
      extraPackages = with pkgs; [
        # Extra pkgs
        xclip
        wl-clipboard
        ripgrep
        nerdfonts

        # Language Servers
        luajitPackages.lua-lsp
        nixd
      ];
    }; 
  };
}

