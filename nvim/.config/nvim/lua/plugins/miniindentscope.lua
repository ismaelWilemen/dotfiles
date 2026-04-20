return {
	"nvim-mini/mini.indentscope",
	version = false,
	config = function()
		require("mini.indentscope").setup({
			options = {

				indent_at_cursor = false,
			},
			symbol = "│",
		})
	end,
}
