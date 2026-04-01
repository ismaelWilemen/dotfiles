-- ================================================================================================
-- TÍTULO : Opções do NeoVim
-- SOBRE  : configurações básicas nativas do neovim
-- ================================================================================================
-- stylua: ignore
-- Configurações Básicas
vim.opt.number = true                                     -- Números de linha
vim.opt.relativenumber = true                             -- Números de linha relativos
vim.opt.cursorline = true                                 -- Destacar linha atual
vim.opt.scrolloff = 10                                    -- Manter 10 linhas acima/abaixo do cursor
vim.opt.sidescrolloff = 8                                 -- Manter 8 colunas à esquerda/direita do cursor
vim.opt.wrap = false                                      -- Não quebrar linhas
vim.opt.cmdheight = 1                                     -- Altura da linha de comando
vim.opt.spelllang = { "pt_br", "en" }                     -- Idiomas para verificação ortográfica

-- Tabulação / Indentação
vim.opt.tabstop = 2                                       -- Largura do tab
vim.opt.shiftwidth = 2                                    -- Largura da indentação
vim.opt.softtabstop = 2                                   -- Soft tab stop
vim.opt.expandtab = true                                  -- Usar espaços em vez de tabs
vim.opt.smartindent = true                                -- Auto-indentação inteligente
vim.opt.autoindent = true                                 -- Copiar indentação da linha atual
vim.opt.grepprg = "rg-vimgrep"                            -- Usar ripgrep se disponível
vim.opt.grepformat = "%f:%l:%c:%m"                        -- arquivo, número da linha, coluna, conteúdo

-- Configurações de Busca
vim.opt.ignorecase = true                                 -- Busca sem distinção de maiúsculas
vim.opt.smartcase = true                                  -- Distingue maiúsculas se houver na busca
vim.opt.hlsearch = false                                  -- Não destacar resultados da busca
vim.opt.incsearch = true                                  -- Mostrar correspondências enquanto digita

-- Configurações Visuais
vim.opt.termguicolors = true                              -- Habilitar cores 24-bit
vim.opt.signcolumn = "yes"                                -- Sempre exibir coluna de sinais
vim.opt.colorcolumn = "120"                               -- Exibir coluna em 100 caracteres
vim.opt.showmatch = true                                  -- Destacar colchetes correspondentes
vim.opt.matchtime = 2                                     -- Tempo para exibir colchete correspondente
vim.opt.completeopt = "menuone,noinsert,noselect"         -- Opções de completação
vim.opt.showmode = false                                  -- Não exibir modo na linha de comando
vim.opt.pumheight = 10                                    -- Altura do menu de completação
vim.opt.pumblend = 10                                     -- Transparência do menu de completação
vim.opt.winblend = 0                                      -- Transparência de janelas flutuantes
vim.opt.conceallevel = 0                                  -- Não ocultar marcação
vim.opt.concealcursor = ""                                -- Exibir marcação mesmo na linha do cursor
vim.opt.redrawtime = 10000                                -- Timeout para redesenho do syntax highlight
vim.opt.maxmempattern = 20000                             -- Memória máxima para correspondência de padrões
vim.opt.synmaxcol = 300                                   -- Limite de colunas para syntax highlight

-- Gerenciamento de Arquivos
vim.opt.backup = false                                    -- Não criar arquivos de backup
vim.opt.writebackup = false                               -- Não fazer backup antes de sobrescrever
vim.opt.swapfile = false                                  -- Não criar arquivos de swap
vim.opt.undofile = true                                   -- Histórico de desfazer persistente
vim.opt.updatetime = 300                                  -- Tempo em ms para disparar CursorHold
vim.opt.timeoutlen = 500                                  -- Tempo em ms para aguardar sequência mapeada
vim.opt.ttimeoutlen = 0                                   -- Sem espera por sequências de código de tecla
vim.opt.autoread = true                                   -- Recarregar arquivo se alterado externamente
vim.opt.autowrite = false                                 -- Não salvar automaticamente em alguns eventos
vim.opt.diffopt:append("vertical")                        -- Divisões de diff verticais
vim.opt.diffopt:append("algorithm:patience")              -- Algoritmo de diff melhorado
vim.opt.diffopt:append("linematch:60")                    -- Melhor destaque de diff (correspondência inteligente de linhas)

-- Definir diretório de undo e garantir que exista
local undodir = "~/.local/share/nvim/undodir"             -- Caminho do diretório de undo
vim.opt.undodir = vim.fn.expand(undodir)                  -- Expandir para caminho completo
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
	vim.fn.mkdir(undodir_path, "p")                         -- Criar se não existir
end

-- Configurações de Comportamento
vim.opt.errorbells = false                                -- Desativar sons de erro
vim.opt.backspace = "indent,eol,start"                    -- Backspace com comportamento natural
vim.opt.autochdir = false                                 -- Não mudar diretório automaticamente
vim.opt.iskeyword:append("-")                             -- Tratar hífen como parte de uma palavra
vim.opt.path:append("**")                                 -- Buscar em subpastas com `gf`
vim.opt.selection = "inclusive"                           -- Usar seleção inclusiva
vim.opt.mouse = "a"                                       -- Habilitar suporte ao mouse
vim.opt.clipboard:append("unnamedplus")                   -- Usar área de transferência do sistema
vim.opt.modifiable = true                                 -- Permitir edição de buffers
vim.opt.encoding = "UTF-8"                                -- Usar codificação UTF-8
vim.opt.wildmenu = true                                   -- Habilitar menu de completação da linha de comando
vim.opt.wildmode = "longest:full,full"                    -- Modo de completação da linha de comando
vim.opt.wildignorecase = true                             -- Completação de comandos sem distinção de maiúsculas

-- Configurações de Cursor
vim.opt.guicursor = {
	"n-v-c:block",                                          -- Normal, Visual, Linha de comando
	"i-ci-ve:block",                                        -- Inserção, Inserção na linha de comando, Visual exclusivo
	"r-cr:hor20",                                           -- Substituição, Substituição na linha de comando
	"o:hor50",                                              -- Operador pendente
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- Todos os modos: piscar e grupos de destaque
	"sm:block-blinkwait175-blinkoff150-blinkon175",         -- Modo showmatch
}

-- Configurações de Dobramento
vim.opt.foldmethod = "expr"                               -- Usar expressão para dobramento
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"      -- Usar treesitter para dobramento
vim.opt.foldlevel = 99                                    -- Manter todos os dobramentos abertos por padrão

-- Comportamento de Divisão de Janelas
vim.opt.splitbelow = true                                 -- Divisões horizontais abrem abaixo
vim.opt.splitright = true                                 -- Divisões verticais abrem à direita
