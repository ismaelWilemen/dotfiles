-- ================================================================================================
-- TITLE : jinja_lsp LSP Setup
-- LINKS :
--   > github: https://github.com/uros-5/jinja-lsp
-- ================================================================================================

--- @param capabilities table LSP client capabilities
--- @return nil
return function(capabilities)
	vim.lsp.config("jinja_lsp", {
		capabilities = capabilities,
		filetypes = { "html" }, -- adiciona isso
		settings = {
			jinja_lsp = {
				templates = "./templates",
			},
		},
	})
end
