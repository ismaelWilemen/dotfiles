-- ================================================================================================
-- TITLE : lualine.nvim
-- ABOUT : Configuração pra statusline.
-- LINKS :
--   > github : https://github.com/nvim-lualine/lualine.nvim
-- ================================================================================================
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "nightfox",
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = "|",
			},
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
