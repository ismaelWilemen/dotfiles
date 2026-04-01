-- ================================================================================================
-- TITLE : nvim-lspconfig
-- ABOUT : Configurações rápidas para o LSP.
-- LINKS :
--   > github                  : https://github.com/neovim/nvim-lspconfig
--   > mason.nvim (dep)        : https://github.com/mason-org/mason.nvim
--   > efmls-configs-nvim (dep): https://github.com/creativenull/efmls-configs-nvim
--   > cmp-nvim-lsp (dep)      : https://github.com/hrsh7th/cmp-nvim-lsp
-- ================================================================================================
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} }, -- Instalador de LSP/DAP/Linter
		"creativenull/efmls-configs-nvim", -- Servidor de linguagem EFM pré-configurado.
		"hrsh7th/cmp-nvim-lsp", -- Fonte pra autocomplete baseada em LSP.
	},
	config = function()
		require("utils.diagnostics").setup()
		require("servers")
	end,
}
