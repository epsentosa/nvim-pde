vim.cmd.colorscheme("sonokai")

set_hl = function (hl_group, opts, ns_id)
  if ns_id then
    vim.api.nvim_set_hl(ns_id , hl_group, opts)
  else
    vim.api.nvim_set_hl(0 , hl_group, opts)
  end
end

-- overide hl colors from default theme below
set_hl("Visual", { bg = "#346273" })
set_hl("LocalMatchHighlight", { italic = true, bg = "#2b2f3c" })
set_hl("LocalCurrentWord", { bold = true, bg = "#3c404e" })
set_hl("LineNrAbove", { fg = "#5a6477" })
set_hl("LineNr", { fg = "yellow" })
set_hl("LineNrBelow", { fg = "#5a6477" })
set_hl("DiagnosticFloatingError", { bg = "#660000" })
set_hl("DiagnosticFloatingWarn", { bg = "#4d4d00" })
set_hl("DiagnosticFloatingInfo", { bg = "#002633" })
set_hl("DiagnosticFloatingHint", { bg = "#0c3300" })
set_hl("InclineNormal", { bg = "#264125" })
set_hl("TreesitterContextLineNumber", { link = "LineNrAbove" })
set_hl("LspSignatureActiveParameter", { link = "LocalCurrentWord" })
set_hl("LspInlayHint", { italic = true, fg = "#7c7e50" })
