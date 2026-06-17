local M = {}

-- ============================================================================
-- PLUGINS (vim.pack)
-- ============================================================================
vim.pack.add({
	"https://www.github.com/lewis6991/gitsigns.nvim",
	"https://www.github.com/echasnovski/mini.nvim",
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://www.github.com/nvim-tree/nvim-tree.lua",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	-- Language Server Protocols
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/creativenull/efmls-configs-nvim",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/Kaiser-Yang/blink-cmp-dictionary",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/folke/zen-mode.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	-- Debugger C
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
	"https://github.com/nvim-neotest/nvim-nio",
	-- Typst Preview
	{
		src = "https://github.com/chomosuke/typst-preview.nvim",
		build = function()
			require("typst-preview").update()
		end,
	},
	-- Markdown
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	-- Emails
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/knownasnaffy/himalaya.nvim",
})

-- ============================================================================
-- PLUGIN CONFIGS
-- ============================================================================

local setup_treesitter = function()
	local status_ok, configs = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		return
	end

	configs.setup({
		ensure_installed = {
			"vim",
			"vimdoc",
			"rust",
			"c",
			"cpp",
			"go",
			"html",
			"css",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"typescript",
			"vue",
			"svelte",
			"bash",
			"typst",
		},

		sync_install = false,

		auto_install = true,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})
end

setup_treesitter()

require("fzf-lua").setup({})

vim.keymap.set("n", "<leader>ff", function()
	require("fzf-lua").files()
end, { desc = "FZF Files" })
vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").live_grep()
end, { desc = "FZF Live Grep" })
vim.keymap.set("n", "<leader>fb", function()
	require("fzf-lua").buffers()
end, { desc = "FZF Buffers" })
vim.keymap.set("n", "<leader>fh", function()
	require("fzf-lua").help_tags()
end, { desc = "FZF Help Tags" })
vim.keymap.set("n", "<leader>fx", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "FZF Diagnostics Document" })
vim.keymap.set("n", "<leader>fX", function()
	require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF Diagnostics Workspace" })

require("mini.ai").setup({})
require("mini.comment").setup({})
require("mini.move").setup({})
require("mini.surround").setup({})
require("mini.cursorword").setup({})
require("mini.indentscope").setup({})
-- require("mini.pairs").setup({})
require("mini.trailspace").setup({})
require("mini.bufremove").setup({})
require("mini.notify").setup({})
require("mini.icons").setup({})
require("mini.starter").setup({})

require("gitsigns").setup({
	signs = {
		add = { text = "\u{2590}" }, -- ▏
		change = { text = "\u{2590}" }, -- ▐
		delete = { text = "\u{2590}" }, -- ◦
		topdelete = { text = "\u{25e6}" }, -- ◦
		changedelete = { text = "\u{25cf}" }, -- ●
		untracked = { text = "\u{25cb}" }, -- ○
	},
	signcolumn = true,
	current_line_blame = false,
})

require("zen-mode").setup({
	window = {
		backdrop = 1,
		width = 80,
		options = {
			signcolumn = "no",
			number = false,
			relativenumber = false,
			foldcolumn = "0",
			list = false,
		},
	},
	plugins = {
		gitsigns = { enabled = true },
		tmux = { enabled = false },
	},
})

vim.keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode" })

require("mason").setup({})

vim.keymap.set("n", "]g", function()
	require("gitsigns").next_hunk()
end, { desc = "Next git hunk" })
vim.keymap.set("n", "[g", function()
	require("gitsigns").prev_hunk()
end, { desc = "Previous git hunk" })
vim.keymap.set("n", "<leader>gs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })
vim.keymap.set("n", "<leader>gB", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle inline blame" })
vim.keymap.set("n", "<leader>gd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this" })

-- Debugger C
local dap = require("dap")
local dapui = require("dapui")

require("nvim-dap-virtual-text").setup({})
dapui.setup()

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" },
}

dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
}

dap.configurations.asm = {
	{
		name = "Launch File",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = true,
	},
}
dap.configurations.nasm = dap.configurations.asm

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.keymap.set("n", "<F5>", function()
	dap.continue()
end, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F10>", function()
	dap.step_over()
end, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F11>", function()
	dap.step_into()
end, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<leader>db", function()
	dap.toggle_breakpoint()
end, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>du", function()
	dapui.toggle()
end, { desc = "Debug: Toggle UI" })

require("render-markdown").setup({})

require("himalaya").setup({})

return M
