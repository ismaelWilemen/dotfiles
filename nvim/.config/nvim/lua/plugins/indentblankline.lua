return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("ibl").setup({
			indent = { char = "│" },
			scope = { enabled = false },
		})
	end,
}
