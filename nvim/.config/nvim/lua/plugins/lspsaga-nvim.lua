-- ================================================================================================
-- TITLE : lspsaga.nvim
-- ABOUT : Melhorias na experiência com o LSP
-- LINKS :
--   > github : https://github.com/nvimdev/lspsaga.nvim
-- ================================================================================================
return {
	"glepnir/lspsaga.nvim",
	lazy = false,
	config = function()
		require("lspsaga").setup({
			-- Keybinds pra navegação na janlea.
			move_in_saga = { prev = "<C-k>", next = "<C-j>" },
			-- Usar enter pra abrir o arquivo com o finder.
			finder_action_keys = {
				open = "<CR>",
			},
			-- Usar enter para abrir o arquivo com o preview da definição.
			definition_action_keys = {
				edit = "<CR>",
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}
