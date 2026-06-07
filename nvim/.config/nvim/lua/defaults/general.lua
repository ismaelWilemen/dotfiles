-- ───── Tema ─────────────────────────────────────────────────────────────────────────────────────
-- O tema é gerenciado pelo plugin colorscheme-persist em lua/plugins/themes.lua

-- Função para padronizar itálicos e estilos visuais
local function customize_theme()
	local groups = {
		-- Itálicos padrão
		Comment = { italic = true },
		Keyword = { italic = true },
		Conditional = { italic = true },
		Repeat = { italic = true },
		Include = { italic = true },
		Type = { italic = true },
		["@constant.builtin"] = { italic = true },
		["@keyword.operator"] = { italic = true },
		-- Flutter closing tags
		FlutterClosingTags = { fg = "#4a4a4a", italic = true },
	}

	for group, opts in pairs(groups) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

-- Aplica as customizações toda vez que o tema mudar
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = customize_theme,
})

-- Chamamos uma vez no boot para garantir
customize_theme()

-- ───── Configs básicas ──────────────────────────────────────────────────────────────────────────
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Line numbers relativas
vim.opt.wrap = false -- Não quebrar linhas
vim.opt.scrolloff = 10 -- Manter 10 linhas acima/abaixo do cursor
vim.opt.sidescrolloff = 8 -- Manter 8 colunas na direita/esquerda do cursor

-- ───── Identação ────────────────────────────────────────────────────────────────────────────────
vim.opt.tabstop = 2 -- Largura do tab
vim.opt.shiftwidth = 2 -- Largura da identação
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.expandtab = true -- Usar espaços ao invés de tabs
vim.opt.smartindent = true -- Auto-indent inteligente
vim.opt.autoindent = true -- Copiar indent da linha atual

-- ───── Configs de busca ─────────────────────────────────────────────────────────────────────────
vim.opt.ignorecase = true -- Busca case-insensitive
vim.opt.smartcase = true -- Case-sensitive caso tenha uppercase na busca
vim.opt.incsearch = true -- Mostrar combinações enquanto digita

-- ───── Visual ───────────────────────────────────────────────────────────────────────────────────
vim.opt.termguicolors = true -- Ativa cores 24-bits
vim.opt.signcolumn = "yes" -- Sempre mostrar signcolumn
vim.opt.colorcolumn = "100" -- Mostrar coluna em 80 caracteres
vim.opt.showmatch = true -- Destacar pares de brackets
vim.opt.matchtime = 2 -- Quanto tempo destacar o bracket
vim.opt.cmdheight = 1 -- Altura da command line
vim.opt.completeopt = "menuone,noinsert,noselect" -- Opções para completion
vim.opt.showmode = false -- Não mostrar o modo no command line
vim.opt.pumheight = 10 -- Altura do menu popup
vim.opt.pumblend = 10 -- Transparência do menu popup
vim.opt.winblend = 0 -- Transparência da janela flutuante
vim.opt.conceallevel = 0 -- Não esconde o Markup
vim.opt.concealcursor = "" -- Não esconde o markup da cursor line
vim.opt.lazyredraw = true -- Não faz redraw durante macros
vim.opt.synmaxcol = 300 -- Limite do syntax highlight
vim.opt.fillchars = { eob = " " } -- Esconde ~ nas linhas em branco

-- ───── Gerenciamento de arquivos ────────────────────────────────────────────────────────────────
vim.opt.backup = false -- Não criar backups
vim.opt.writebackup = false -- Não criar backups antes de salvar
vim.opt.swapfile = false -- Não criar swapfiles
vim.opt.undofile = true -- Undo persistente
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Diretório do undo
vim.opt.updatetime = 300 -- Completion mais rápido
vim.opt.timeoutlen = 500 -- Duração do key timeout
vim.opt.ttimeoutlen = 0 -- Key code timeout
vim.opt.autoread = true -- Autoreload em arquivos modificados fora do nvim
vim.opt.autowrite = false -- Não salvar automaticamente

-- ───── Cria undodir caso não exista ─────────────────────────────────────────────────────────────
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- ───── Configs de comportamento ─────────────────────────────────────────────────────────────────
vim.opt.hidden = true -- Permitir buffers escondidos
vim.opt.errorbells = false -- Sem error bells
vim.opt.backspace = "indent,eol,start" -- Melhor comportamento do backspace
vim.opt.autochdir = false -- Não trocar o diretório automaticamente
vim.opt.iskeyword:append("-") -- Tratar hífem como parte da palavra
vim.opt.path:append("**") -- Incluir subdiretórios na busca
vim.opt.selection = "exclusive" -- Comportamento da seleção
vim.opt.mouse = "a" -- Ativar suporte com o mouse
vim.opt.clipboard:append("unnamedplus") -- Usar clipboard do sistema
vim.opt.modifiable = true -- Permitir modificações do buffer
vim.opt.encoding = "UTF-8" -- Define encoding

-- ───── Cursor ───────────────────────────────────────────────────────────────────────────────────
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- ───── Configs de folding ───────────────────────────────────────────────────────────────────────
vim.opt.foldmethod = "expr" -- Usa expressão para folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Usa treesitter para folding
vim.opt.foldlevel = 99 -- Inicia com todos os folds abertos

-- ───── Comportamento dos splits ─────────────────────────────────────────────────────────────────
vim.opt.splitbelow = true -- Horizontal splits pra baixo
vim.opt.splitright = true -- Vertical splits pra direita
