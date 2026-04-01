-- ================================================================================================
-- TITLE : codeium/windsurf
-- ABOUT : Plugin windwsurf nativo.
-- LINKS :
--   > github : https://github.com/Exafunction/windsurf.nvim
-- ================================================================================================
return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({})
	end,
}
