return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					path_display = { "truncate " },
					preview = {
						treesitter = false,
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			local builtin = require("telescope.builtin")
			local keymap = vim.keymap
			keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in project" })
			vim.keymap.set("n", "<leader>fr", function()
				vim.cmd("silent! wall")
				vim.schedule(function()
					require("telescope.builtin").oldfiles()
				end)
			end, { desc = "Recent Files" })
			keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in project (grep)" })
			keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor" })
			keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy find open buffers" })
			keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Fuzzy find help tags" })
			keymap.set("n", "gr", builtin.lsp_references, { desc = "LSP References in Telescope" })
		end,
	},
}
