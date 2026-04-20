-- ───── Key maps ─────────────────────────────────────────────────────────────────────────────────
vim.g.mapleader = " "                                 -- Leader key pro espaço
vim.g.maplocalleader = " "                            -- Leader key pro espaço

-- ───── Normal mode maps ─────────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Limpa os destaques de busca" })

-- ───── Y até EOL ────────────────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "Y", "y$", { desc = "Yank até EOL" })

-- ───── Centralizar tela enquanto pula ───────────────────────────────────────────────────────────
vim.keymap.set("n", "n", "nzzzv", { desc = "Próximo resultado de busca (centralizado)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Resultado de busca anterior (centralizado)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Meia página pra baixo (centralizado)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Meia página pra cima (centralizado)" })

-- ───── Melhor comportamento de paste ────────────────────────────────────────────────────────────
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Colar sem copiar (sobrescrever)" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copiar para o clipboard do sistema" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copiar linha para o clipboard do sistema" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+p', { desc = "Colar do clipboard do sistema" })

-- ───── Deletar sem copiar ───────────────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Deletar sem copiar" })

-- ───── Navegação dos buffers ────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Próximo buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Buffer anterior" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Deletar buffer" })

-- ───── Melhor navegação das janelas ─────────────────────────────────────────────────────────────
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Mover para janela pra esquerda" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Mover para janela pra baixo" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Mover para janela pra cima" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Mover para janela pra direita" })

-- ───── Splitting & Resizing ─────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split horizontal" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Aumentar altura da janela" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Diminuir altura da janela" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Diminuir largura da janela" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Aumentar largura da janela" })

-- ───── Mover linhas pra cima/baixo ──────────────────────────────────────────────────────────────
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Mover linha abaixo" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Mover linha acima" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Mover seleção para baixo" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Mover seleção para cima" })

-- ───── Melhor identação no visual mode ──────────────────────────────────────────────────────────
vim.keymap.set("v", "<", "<gv", { desc = "Indentar para trás e reselecionar" })
vim.keymap.set("v", ">", ">gv", { desc = "Indentar para frente e reselecionar" })

-- ───── Navegação rápida nos arquivos ────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Encontrar arquivo" })

-- ───── Melhor comportamento do J ────────────────────────────────────────────────────────────────
vim.keymap.set("n", "J", "mzJ`z", { desc = "Juntar linhas e manter a posição do cursor" })

-- ───── Outras keybinds ──────────────────────────────────────────────────────────────────────────
vim.keymap.set("i", "jj", "<Esc>", { desc = "Alternativa para sair do insert mode" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Alternativa para sair do insert mode" })

-- ───── Edição rápida de config ──────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>fc", ":e $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>rc", ":so $MYVIMRC<CR>", { desc = "Reload config" })
