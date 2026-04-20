return {
	"Bekaboo/deadcolumn.nvim",
	config = function()
		require("deadcolumn").setup({
			scope = "line",
			modes = function(mode)
				return true
			end,
		})
	end,
}
