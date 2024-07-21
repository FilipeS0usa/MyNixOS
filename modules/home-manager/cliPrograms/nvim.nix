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

        # LSP
        nvim-lspconfig
        # Autocompletion
        cmp-nvim-lsp
        nvim-cmp
        # Autoconfiguration of LSPs
        neodev-nvim 
        
        # Make it prettier
        lualine-nvim
        nvim-web-devicons

        # Fuzzy Finder
        telescope-nvim
        telescope-fzf-native-nvim

        # Another way to navigate between files
        harpoon

        {
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";	
        }

        # Treesitter
        nvim-treesitter.withAllGrammars
        
        # Better highligthing for Nix files
        vim-nix

        # File Tree
        nvim-tree-lua # To toggle it just do :NvimTreeToggle

        # Indentation lines
        indent-blankline-nvim
        
      ];

      extraLuaConfig = '' 
        ${builtins.readFile ./files/nvim/options.lua}
        ${builtins.readFile ./files/nvim/plugin/harpoon.lua}
        ${builtins.readFile ./files/nvim/plugin/rosepine.lua}
        ${builtins.readFile ./files/nvim/plugin/telescope.lua}
        ${builtins.readFile ./files/nvim/plugin/lualine.lua}
        ${builtins.readFile ./files/nvim/plugin/treesitter.lua}
        ${builtins.readFile ./files/nvim/plugin/lsp.lua}
      '';
      
      extraPackages = with pkgs; [
        # Extra pkgs
        xclip
        wl-clipboard
        ripgrep
        nerdfonts

        # Language Servers
        luajitPackages.lua-lsp # Lua
        nil # Nix
        yaml-language-server # Yaml
        python311Packages.python-lsp-server # Python
        gopls # Go
        java-language-server # Java
        phpactor # PHP
        sqls # SQL
        vscode-langservers-extracted # HTML, CSS, JavaScript
      ];
    }; 
  };
}

