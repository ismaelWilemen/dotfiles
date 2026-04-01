-- ================================================================================================
-- TITLE : lsp.lua
-- ABOUT : Configura keymaps e funcionalidades para o LSP.
-- ================================================================================================
local M = {}

M.on_attach = function(event)
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if not client then
		return
	end
	local bufnr = event.buf
	local keymap = vim.keymap.set
	local opts = {
		noremap = true, -- Previne mapeamento recursivo.
		silent = true, -- Não joga o comando pro CLI.
		buffer = bufnr, -- Restringe o keymap ao buffer atual.
	}

	-- native neovim keymaps
	keymap("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- Ir para definição.
	keymap("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- Ir para definição.
	keymap("n", "<leader>gS", "<cmd>vsplit | Lspsaga goto_definition<CR>", opts) --Ir para definição em tela dividida.
	keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- Code actions.
	keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- Renomear símbolos.
	keymap("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- Diagnósticos da linha (flutuante).
	keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- Diagnósticos no cursor.
	keymap("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- Diagnóstico anterior.
	keymap("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- Próximo diagnóstico.
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- Documentação flutuante.

	-- fzf-lua keymaps
	keymap("n", "<leader>fd", "<cmd>FzfLua lsp_finder<CR>", opts) -- LSP Finder (Definições e referências)
	keymap("n", "<leader>fr", "<cmd>FzfLua lsp_references<CR>", opts) -- Mostrar todas as referências do símbolo no cursor.
	keymap("n", "<leader>ft", "<cmd>FzfLua lsp_typedefs<CR>", opts) -- Ir para a definição do tipo do símbolo  no cursor.
	keymap("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", opts) -- Listar todos os símbolos.
	keymap("n", "<leader>fw", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts) -- Procurar por qualquer símbolo em todo o projeto.
	keymap("n", "<leader>fi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- Ir para implementação.

	-- Ordena imports
	if client:supports_method("textDocument/codeAction", bufnr) then
		keymap("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = {
					only = { "source.organizeImports" },
					diagnostics = {},
				},
				apply = true,
				bufnr = bufnr,
			})
			-- Formatar depois de mudar a ordem dos imports
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50) -- Pequeno delay pra dar tempo de formatar os imports.
		end, opts)
	end
end

return M
