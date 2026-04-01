-- ================================================================================================
-- TÍTULO : Bootstrap & Configuração de Plugins do lazy.nvim
-- SOBRE  :
--   Inicializa o gerenciador de plugins 'lazy.nvim' clonando-o caso não esteja presente,
--   adiciona-o ao início do runtime path e carrega os arquivos de configuração principais
--   (globals, options, keymaps, autocmds). Por fim, inicializa o 'lazy.nvim' com os plugins.
-- LINKS  :
--   > lazy.nvim github  : https://github.com/folke/lazy.nvim
--   > lazy.nvim website : https://lazy.folke.io/installation
-- ================================================================================================
-- Instalando o lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field (fs_stat)
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Requerindo os arquivos de configuração
require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmds")

local plugins_dir = "plugins"

require("lazy").setup({
	spec = {
		{ import = plugins_dir },
	},
	rtp = {
		disabled_plugins = { -- Desabilita os plugins padrão do netrw
			"netrw",
			"netrwPlugin",
		},
	},
	install = {
		colorscheme = { -- Define o tema padrão
			"melange",
			-- "nightfox,",
		},
	},
	checker = { enabled = true },
})
