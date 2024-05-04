require'cmp'.setup{
	sources = {
		{ name = 'nvim_lsp' }
	}
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('neodev').setup()

-- Lua
require('lspconfig').lua_ls.setup {
    capabilities = capabilities,
	root_dir = function()
        return vim.loop.cwd()
    end,
	cmd = { "lua-lsp" },
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    }
}

-- Nix
require('lspconfig').nil_ls.setup{
	capabilities = capabilities
}

-- Python
require('lspconfig').pylsp.setup{
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = {'W391'},
					maxLineLength = 100
				}
			}
		}
	}
}

-- Yaml
require('lspconfig').yamlls.setup {
	capabilities = capabilities
}

-- Go
require('lspconfig').gopls.setup{
	capabilities = capabilities
}

-- Java
require('lspconfig').java_language_server.setup{
	capabilities = capabilities
}

-- PHP
require('lspconfig').phpactor.setup{
	capabilities = capabilities
}

-- SQL
require('lspconfig').sqls.setup{
	capabilities = capabilities
}

-- HTML, CSS, JavaScript
require('lspconfig').html.setup{
	capabilities = capabilities
}
