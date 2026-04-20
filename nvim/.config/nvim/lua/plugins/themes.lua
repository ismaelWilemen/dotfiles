return {
	-- Gerenciador de persistência de temas
	{
		"propet/colorscheme-persist.nvim",
		lazy = false,
		config = true,
		dependencies = { "nvim-telescope/telescope.nvim" },
		opts = {
			fallback = "sorbet",
		},
		keys = {
			{
				"<leader>sc",
				function()
					-- Chamamos o picker com o preview ativado explicitamente
					require("colorscheme-persist").picker({
						enable_preview = true,
					})
				end,
				desc = "Select Colorscheme (Persist)",
			},
		},
	},

	-- Lista de Temas
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "folke/tokyonight.nvim", priority = 1000 },
	{ "rose-pine/neovim", name = "rose-pine", priority = 1000 },
	{ "sainnhe/gruvbox-material", priority = 1000 },
	{ "rebelot/kanagawa.nvim", priority = 1000 },
	{ "sainnhe/everforest", priority = 1000 },
	{ "EdenEast/nightfox.nvim", priority = 1000 },
	{ "savq/melange-nvim", priority = 1000 },
	{ "tanvirtin/monokai.nvim", priority = 1000 },
	{ "phha/zenburn.nvim", priority = 1000 },
	{ "nyoom-engineering/oxocarbon.nvim", priority = 1000 },
	{ "maxmx03/solarized.nvim", priority = 1000 },
	{ "craftzdog/solarized-osaka.nvim", priority = 1000 },
}
