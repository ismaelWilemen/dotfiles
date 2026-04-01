-- ================================================================================================
-- TITLE : nvim-tree.lua
-- ABOUT : Explorador de arquivos em árvore.
-- LINKS :
--   > github : https://github.com/nvim-tree/nvim-tree.lua
-- ================================================================================================
return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false, -- Mostra arquivos ocultos
			},
			view = {
				adaptive_size = true,
			},
		})
	end,
}
