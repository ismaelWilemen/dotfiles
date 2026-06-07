return {
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			-- add options here
			-- or leave it empty to use the default settings
		},
		keys = {
			-- suggested keymap
			{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
	{
		"jakewvincent/mkdnflow.nvim",
		config = function()
			require("mkdnflow").setup({})
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,

		-- Completion for `blink.cmp`
		dependencies = { "saghen/blink.cmp", "saghen/blink.lib" },
	},
	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty", -- funciona no Ghostty também
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
				},
			},
			max_width = 80,
			max_height = 20,
		},
	},
}
