-- ================================================================================================
-- TITLE : melange-nvim
-- ABOUT : Colorscheme inspirado no tema Melange do Sublime Text.
-- LINKS :
--   > github : https://github.com/savq/melange-nvim
-- ================================================================================================
return {
	{
		"xiyaowong/nvim-transparent",
		lazy = false,
		priority = 999,
		opts = {
			extra_groups = {
				"NvimTreeNormal",
				"NvimTreeNormalNC",
				"NvimTreeSignColumn",
				"NvimTreeEndOfBuffer",
				"NvimTreeWinSeparator",
			},
		},
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 999,
		config = function()
			local palette = require("nightfox.palette").load("terafox")

			require("nightfox").setup({
				options = {
					transparent = false,
          styles = {
            comments = "italic",
            keywords = "italic",
            types = "italic",
            functions = "italic",
                  },
				},
			})
			vim.cmd("colorscheme terafox")
		end,
	},
}
