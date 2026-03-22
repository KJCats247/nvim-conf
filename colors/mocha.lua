vim.g.colors_name = "mocha"

local mocha = {
	rosewater = "#F5E0DC",
	flamingo = "#F2CDCD",
	pink = "#F5C2E7",
	mauve = "#CBA6F7",
	red = "#F38BA8",
	maroon = "#EBA0AC",
	peach = "#FAB387",
	yellow = "#F9E2AF",
	green = "#A6E3A1",
	teal = "#94E2D5",
	sky = "#89DCEB",
	sapphire = "#74C7EC",
	blue = "#89B4FA",
	lavender = "#B4BEFE",
	text = "#CDD6F4",
	subtext1 = "#BAC2DE",
	subtext0 = "#A6ADC8",
	overlay2 = "#9399B2",
	overlay1 = "#7F849C",
	overlay0 = "#6C7086",
	surface2 = "#585B70",
	surface1 = "#45475A",
	surface0 = "#313244",
	base = "#1E1E2E",
	mantle = "#181825",
	crust = "#11111B",
}

-- Basic Highlights
vim.api.nvim_set_hl(0, "Normal", { fg = mocha.text, bg = mocha.base })
vim.api.nvim_set_hl(0, "Comment", { fg = mocha.overlay1, italic = true })

-- Legacy Syntax Highlights (als Fallback)
vim.api.nvim_set_hl(0, "Identifier", { fg = mocha.sky })
vim.api.nvim_set_hl(0, "Function", { fg = mocha.peach })
vim.api.nvim_set_hl(0, "String", { fg = mocha.green })
vim.api.nvim_set_hl(0, "Number", { fg = mocha.lavender })
vim.api.nvim_set_hl(0, "Keyword", { fg = mocha.red })
vim.api.nvim_set_hl(0, "Type", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "Constant", { fg = mocha.red })
vim.api.nvim_set_hl(0, "Statement", { fg = mocha.pink })
vim.api.nvim_set_hl(0, "PreProc", { fg = mocha.pink })

-- Treesitter Highlights (Neovim 0.9+)
vim.api.nvim_set_hl(0, "@variable", { fg = mocha.maroon })
vim.api.nvim_set_hl(0, "@variable.builtin", { fg = mocha.red, italic = true })
vim.api.nvim_set_hl(0, "@variable.parameter", { fg = mocha.maroon, italic = true })
vim.api.nvim_set_hl(0, "@function", { fg = mocha.blue })
vim.api.nvim_set_hl(0, "@function.call", { fg = mocha.blue })
vim.api.nvim_set_hl(0, "@function.macro", { fg = mocha.teal }) -- Super für C-Makros
vim.api.nvim_set_hl(0, "@keyword", { fg = mocha.red })
vim.api.nvim_set_hl(0, "@keyword.return", { fg = mocha.pink })
vim.api.nvim_set_hl(0, "@type", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = mocha.yellow })
vim.api.nvim_set_hl(0, "@string", { fg = mocha.green })
vim.api.nvim_set_hl(0, "@number", { fg = mocha.peach })
vim.api.nvim_set_hl(0, "@boolean", { fg = mocha.peach })
vim.api.nvim_set_hl(0, "@operator", { fg = mocha.sky })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = mocha.overlay2 })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = mocha.overlay1 })
vim.api.nvim_set_hl(0, "@property", { fg = mocha.lavender })
vim.api.nvim_set_hl(0, "@constant", { fg = mocha.peach })

-- Präzisere Treesitter-Typisierung (Perfekt für C)
vim.api.nvim_set_hl(0, "@keyword.modifier", { fg = mocha.red }) -- Macht 'typedef', 'static', 'const' rot
vim.api.nvim_set_hl(0, "@keyword.type", { fg = mocha.mauve }) -- Macht 'struct', 'enum', 'union' lila
vim.api.nvim_set_hl(0, "@keyword.directive", { fg = mocha.mauve }) -- Färbt z.B. '#include' oder '#ifdef' lila
vim.api.nvim_set_hl(0, "@keyword.directive.define", { fg = mocha.red }) -- Färbt speziell '#define' rot

vim.api.nvim_set_hl(0, "@type", { fg = mocha.sapphire }) -- Macht deinen Typnamen ('smth') gelb
vim.api.nvim_set_hl(0, "@type.builtin", { fg = mocha.peach }) -- Macht 'int', 'char', 'void' pfirsichfarben

-- LSP Diagnostics (Fehler, Warnungen, Infos)
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = mocha.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = mocha.yellow })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = mocha.sky })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = mocha.teal })

-- Wellenlinien unter fehlerhaftem Code
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = mocha.red })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = mocha.yellow })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = mocha.sky })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = mocha.teal })

-- Virtueller Text (Die Fehlermeldung am Ende der Zeile)
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = mocha.red, bg = mocha.crust })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = mocha.yellow, bg = mocha.crust })

-- UI Elements
vim.api.nvim_set_hl(0, "LineNr", { fg = mocha.overlay0 })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "StatusLine", { fg = mocha.flamingo, bg = mocha.mantle })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = mocha.overlay0, bg = mocha.base })

-- Completion Window (Pmenu)
vim.api.nvim_set_hl(0, "Pmenu", { fg = mocha.text, bg = mocha.crust })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = mocha.maroon, bg = mocha.surface2, bold = true })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = mocha.base })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = mocha.base })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = mocha.overlay0, bg = mocha.surface1 })

-- ============================================================================
-- PLUGIN HIGHLIGHTS
-- ============================================================================

-- Fzf-Lua (Dein blitzschneller Sucher)
vim.api.nvim_set_hl(0, "FzfLuaNormal", { fg = mocha.text, bg = mocha.base })
vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "FzfLuaTitle", { fg = mocha.peach, bold = true })
vim.api.nvim_set_hl(0, "FzfLuaCursor", { fg = mocha.base, bg = mocha.text })
vim.api.nvim_set_hl(0, "FzfLuaCursorLine", { bg = mocha.surface0 })
vim.api.nvim_set_hl(0, "FzfLuaCursorLineNr", { fg = mocha.text, bg = mocha.surface0 })
vim.api.nvim_set_hl(0, "FzfLuaSearch", { fg = mocha.peach, bg = mocha.surface1 })
vim.api.nvim_set_hl(0, "FzfLuaMatch", { fg = mocha.pink, bold = true })

-- GitSigns (Kleine Indikatoren am linken Rand)
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = mocha.green, bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = mocha.yellow, bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = mocha.red, bg = "NONE" })

-- Mini.nvim (Indentscope, Cursorword & Starter)
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = mocha.overlay0 })
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbolOff", { fg = mocha.overlay0 })
vim.api.nvim_set_hl(0, "MiniCursorword", { bg = mocha.surface1 })
vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = mocha.surface1 })
vim.api.nvim_set_hl(0, "MiniStarterItemPrefix", { fg = mocha.yellow })
vim.api.nvim_set_hl(0, "MiniStarterItemBullet", { fg = mocha.overlay0 })
vim.api.nvim_set_hl(0, "MiniStarterItem", { fg = mocha.text })
vim.api.nvim_set_hl(0, "MiniStarterSection", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "MiniStarterQuery", { fg = mocha.sky })

-- NvimTree (Dein Datei-Explorer)
vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = mocha.text, bg = mocha.mantle })
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = mocha.blue })
vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = mocha.red, bold = true })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = mocha.blue, bold = true })
vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = mocha.overlay0 })
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = mocha.overlay0 })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = mocha.crust, bg = mocha.crust })
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = mocha.yellow })
vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = mocha.green })
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = mocha.red })
