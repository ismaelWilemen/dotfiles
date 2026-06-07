return {
	{
		"akinsho/flutter-tools.nvim",
		ft = "dart",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			require("flutter-tools").setup({
				widget_guides = { enabled = true },
				closing_tags = {
					highlight = "FlutterClosingTags",
					prefix = "// ",
					enabled = true,
				},
				dev_log = { enabled = true, open_cmd = "tabedit" },
				lsp = {
					settings = {
						showTodos = true,
						completeFunctionCalls = true,
						enableSnippets = true,
					},
				},
			})
		end,
	},
}
