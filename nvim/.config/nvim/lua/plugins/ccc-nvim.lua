-- ================================================================================================
-- TITLE : ccc.nvim
-- ABOUT : Color picker e destacador
-- LINKS :
--   > github : https://github.com/uga-rosa/ccc.nvim
-- ================================================================================================
return {
	"uga-rosa/ccc.nvim",
	config = function()
		require("ccc").setup({
			highlighter = {
				auto_enable = true, -- Abilita o destaque automático
				lsp = true, -- Destaca as cores do LSP também
			},
			highlight_mode = "virtual", -- Círculos pequenos com a cor perto da declaração
		})
	end,
}
