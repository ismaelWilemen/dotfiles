-- ================================================================================================
-- TITLE : efm-langserver
-- ABOUT : Um LSP geral pra linters/formatters.
-- LINKS :
--   > github : https://github.com/mattn/efm-langserver
--   > configs: https://github.com/creativenull/efmls-configs-nvim/tree/main
-- ================================================================================================
--- @param capabilities table LSP client capabilities (from nvim-cmp)
--- @return nil
return function(capabilities)
	local luacheck = require("efmls-configs.linters.luacheck")        -- lua linter
	local stylua = require("efmls-configs.formatters.stylua")         -- lua formatter
	local flake8 = require("efmls-configs.linters.flake8")            -- python linter
	local black = require("efmls-configs.formatters.black")           -- python formatter
	local prettier_d = require("efmls-configs.formatters.prettier_d") -- ts/js/json/css formatter
	local eslint_d = require("efmls-configs.linters.eslint_d")        -- ts/js/json linter
	local fixjson = require("efmls-configs.formatters.fixjson")       -- json formatter
	local shellcheck = require("efmls-configs.linters.shellcheck")    -- bash linter
	local shfmt = require("efmls-configs.formatters.shfmt")           -- bash formatter
	local djlint = require("efmls-configs.linters.djlint")            -- html/jinja linter
	local djlint_fmt = require("efmls-configs.formatters.djlint")     -- html/jinja formatter

	vim.lsp.config("efm", {
		capabilities = capabilities,
		filetypes = {
			"css",
			"html",
			"javascript",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"python",
			"sh",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				css = { prettier_d },
				html = { djlint, djlint_fmt },
				javascript = { eslint_d, prettier_d },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				lua = { luacheck, stylua },
				markdown = { prettier_d },
				python = { flake8, black },
				sh = { shellcheck, shfmt },
			},
		},
	})
end
