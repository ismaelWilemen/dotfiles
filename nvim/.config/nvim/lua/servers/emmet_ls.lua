-- ================================================================================================
-- TITLE : emmet_ls (Emmet Language Server) LSP Setup
-- ABOUT : Configura um LSP para o Emmet.
-- LINKS :
--   > github: https://github.com/aca/emmet-ls
-- ================================================================================================
--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
return function(capabilities)
	vim.lsp.config("emmet_ls", {
		capabilities = capabilities,
		filetypes = {
			"javascript",
			"css",
			"sass",
			"scss",
		},
	})
end
