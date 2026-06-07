return {
	"nvim-mini/mini.files",
	version = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },

	keys = {
		{
			"<leader>e",
			function()
				local mf = require("mini.files")

				if not mf.close() then
					mf.open(vim.fn.expand("%:p:h"))
				end
			end,
			desc = "Toggle explorer",
		},
	},

	config = function()
		require("mini.files").setup({
			mappings = {
				go_in = "l",
				go_in_plus = "<CR>",
			},
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id

				vim.keymap.set("n", "<CR>", function()
					require("mini.files").go_in({ close_on_file = true })
				end, { buffer = buf_id })
			end,
		})
	end,
}
