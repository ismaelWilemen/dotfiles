local M = {}

function M.apply()
  local ok, colors = pcall(require, "config.colors")
  if not ok then
    return
  end

  -- Background and general
  vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = colors.on_surface })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", fg = colors.on_surface_variant })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", fg = colors.outline_variant })
  
  -- Floating windows (Mason, LSP, etc.)
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.surface_container_high or colors.surface, fg = colors.on_surface })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.primary, bg = "none" })
  
  -- Completion Menu
  vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.surface_container or colors.surface, fg = colors.on_surface })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.primary_container, fg = colors.on_primary_container, bold = true })
  
  -- Cursor and Line
  vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.surface_container_low or colors.surface_variant })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.primary, bold = true })
  vim.api.nvim_set_hl(0, "LineNr", { fg = colors.outline })
  
  -- Telescope
  vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.outline })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.tertiary })
  vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = colors.tertiary })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.secondary_container, fg = colors.on_secondary_container })
  
  -- Syntax Highlighting (Less monochrome)
  vim.api.nvim_set_hl(0, "Function", { fg = colors.primary, bold = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = colors.tertiary, italic = true })
  vim.api.nvim_set_hl(0, "Statement", { fg = colors.tertiary, italic = true })
  vim.api.nvim_set_hl(0, "String", { fg = colors.secondary })
  vim.api.nvim_set_hl(0, "Number", { fg = colors.tertiary })
  vim.api.nvim_set_hl(0, "Boolean", { fg = colors.tertiary, bold = true })
  vim.api.nvim_set_hl(0, "Identifier", { fg = colors.on_surface })
  vim.api.nvim_set_hl(0, "Constant", { fg = colors.secondary, bold = true })
  vim.api.nvim_set_hl(0, "Comment", { fg = colors.outline, italic = true })
  vim.api.nvim_set_hl(0, "Type", { fg = colors.primary_container })
  vim.api.nvim_set_hl(0, "PreProc", { fg = colors.secondary })
  vim.api.nvim_set_hl(0, "Operator", { fg = colors.outline })
  vim.api.nvim_set_hl(0, "Todo", { bg = colors.tertiary_container, fg = colors.on_tertiary_container, bold = true })

  -- Treesitter
  vim.api.nvim_set_hl(0, "@variable", { fg = colors.on_surface })
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = colors.tertiary, italic = true })
  vim.api.nvim_set_hl(0, "@function", { link = "Function" })
  vim.api.nvim_set_hl(0, "@function.builtin", { fg = colors.primary, bold = true, italic = true })
  vim.api.nvim_set_hl(0, "@keyword", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "@keyword.function", { fg = colors.tertiary, italic = true })
  vim.api.nvim_set_hl(0, "@keyword.return", { fg = colors.tertiary, italic = true })
  vim.api.nvim_set_hl(0, "@constant", { link = "Constant" })
  vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
  vim.api.nvim_set_hl(0, "@type", { link = "Type" })
  vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.primary_container, italic = true })
  vim.api.nvim_set_hl(0, "@string", { link = "String" })
  vim.api.nvim_set_hl(0, "@property", { fg = colors.secondary })
  vim.api.nvim_set_hl(0, "@field", { fg = colors.secondary })
  vim.api.nvim_set_hl(0, "@parameter", { fg = colors.on_surface_variant, italic = true })
  vim.api.nvim_set_hl(0, "@method", { link = "Function" })
  vim.api.nvim_set_hl(0, "@operator", { link = "Operator" })
  vim.api.nvim_set_hl(0, "@constructor", { fg = colors.primary })
  vim.api.nvim_set_hl(0, "@punctuation", { fg = colors.outline })

  -- LSP Semantic Tokens
  vim.api.nvim_set_hl(0, "@lsp.type.variable", { link = "@variable" })
  vim.api.nvim_set_hl(0, "@lsp.type.function", { link = "@function" })
  vim.api.nvim_set_hl(0, "@lsp.type.keyword", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@lsp.type.comment", { link = "@comment" })
  vim.api.nvim_set_hl(0, "@lsp.type.type", { link = "@type" })
  
  -- Diagnostics
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.error })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.tertiary })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.primary })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.secondary })
  
  -- Git
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.primary })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.tertiary })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.error })

end

return M
