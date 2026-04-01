-- ================================================================================================
-- TITLE : init.lua
-- ABOUT : Inicializa os LSPs configurados.
-- ================================================================================================
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Language Server Protocol (LSP)
require("servers.bashls")(capabilities)
require("servers.emmet_ls")(capabilities)
require("servers.jinja_lsp")(capabilities)
require("servers.jsonls")(capabilities)
require("servers.lua_ls")(capabilities)
require("servers.pyright")(capabilities)
require("servers.ts_ls")(capabilities)
require("servers.yamlls")(capabilities)

-- Linters & Formatters
require("servers.efm-langserver")(capabilities)

vim.lsp.enable({
	"bashls",
	"efm",
	"emmet_ls",
	"jinja_lsp",
	"jsonls",
	"lua_ls",
	"pyright",
	"ts_ls",
	"yamlls",
})
