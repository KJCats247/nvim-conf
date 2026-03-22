vim.g.colors_name = "catppuccin"

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

-- Syntax Highlights
vim.api.nvim_set_hl(0, "Identifier", { fg = mocha.sky })
vim.api.nvim_set_hl(0, "Function", { fg = mocha.peach })
vim.api.nvim_set_hl(0, "String", { fg = mocha.green })
vim.api.nvim_set_hl(0, "Number", { fg = mocha.lavender })
vim.api.nvim_set_hl(0, "Keyword", { fg = mocha.red })
vim.api.nvim_set_hl(0, "Type", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "Constant", { fg = mocha.red })

-- UI Elements
vim.api.nvim_set_hl(0, "LineNr", { fg = mocha.overlay0 })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "StatusLine", { fg = mocha.flamingo, bg = mocha.mantle })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = mocha.overlay0, bg = mocha.base })

-- Completion Window
-- Background of the popup window and default text color
vim.api.nvim_set_hl(0, "Pmenu", { fg = mocha.text, bg = mocha.crust })

-- Selected line in the popup menu
vim.api.nvim_set_hl(0, "PmenuSel", { fg = mocha.maroon, bg = mocha.surface2, bold = true })

-- Scrollbar (Background of the bar)
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = mocha.base })

-- Scrollbar (Thumb/Slider)
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = mocha.base })

-- Border for floating windows (used by nvim-cmp and LSP-Hover)
vim.api.nvim_set_hl(0, "FloatBorder", { fg = mocha.overlay0, bg = mocha.surface1 })
