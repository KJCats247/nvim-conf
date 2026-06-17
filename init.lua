vim.opt.termguicolors = true
vim.cmd.colorscheme("mocha")

local function set_transparent() -- set UI component to transparent
	local groups = {
		"Normal",
		"NormalNC",
		"EndOfBuffer",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
	}
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end

set_transparent()

-- Requires
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.utils")
require("plugins")

local function packadd(name)
	vim.cmd("packadd " .. name)
end
packadd("nvim-treesitter")
packadd("gitsigns.nvim")
packadd("mini.nvim")
packadd("fzf-lua")
require("fzf-lua").register_ui_select()
packadd("zen-mode.nvim")
packadd("plenary.nvim")
packadd("render-markdown.nvim")

-- LSP
packadd("nvim-lspconfig")
packadd("mason.nvim")
packadd("efmls-configs-nvim")
packadd("blink.cmp")
packadd("blink-cmp-dictionary")
packadd("LuaSnip")
require("lsp")

--Debugger C
packadd("nvim-dap")
packadd("nvim-dap-ui")
packadd("nvim-dap-virtual-text")
packadd("nvim-nio")

--Emails
packadd("nui.nvim")
packadd("himalaya.nvim")
