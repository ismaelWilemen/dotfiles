-- ================================================================================================
-- TITLE: NeoVim keymaps
-- ABOUT: Define alguns keymaps
-- ================================================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Edição rápida de configuração
vim.keymap.set("n", "<leader>rc", "<Cmd>e ~/.config/nvim/init.lua<CR>", { desc = "Editar configuração" })
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Baixo (com quebra de linha)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Cima (com quebra de linha)" })

-- Busca
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Limpar destaques de busca" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Próximo resultado de busca (centralizado)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Resultado anterior de busca (centralizado)" })

-- Movimento
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Meia página abaixo (centralizado)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Meia página acima (centralizado)" })

-- Yank
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Colar sem substituir o yank" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Deletar sem registrar no yank" })
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("arquivo:", path)
end, { desc = "Copiar caminho completo do arquivo" })

-- Buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Próximo buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Buffer anterior" })

-- Janelas
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Mover para janela da esquerda" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Mover para janela de baixo" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Mover para janela de cima" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Mover para janela da direita" })

-- Splits
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Dividir janela verticalmente" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Dividir janela horizontalmente" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Aumentar altura da janela" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Diminuir altura da janela" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Diminuir largura da janela" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Aumentar largura da janela" })

-- Mover linhas
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Mover linha abaixo" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Mover linha acima" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Mover seleção abaixo" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Mover seleção acima" })

-- Identação
vim.keymap.set("v", "<", "<gv", { desc = "Indentar à esquerda e manter seleção" })
vim.keymap.set("v", ">", ">gv", { desc = "Indentar à direita e manter seleção" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Juntar linhas e manter posição do cursor" })

-- Nvim tree
vim.keymap.set("n", "<leader>e", function()
	if require("zen-mode.view").is_open() then
		require("zen-mode").close()
	end
	local api = require("nvim-tree.api")
	if api.tree.is_visible() then
		api.tree.close()
	else
		api.tree.open()
	end
end, { desc = "Alternar NvimTree (fechar Zen se ativo)" })
