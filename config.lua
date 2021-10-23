-- general
vim.cmd("set number relativenumber")

lvim.format_on_save = false

lvim.leader = "space"

lvim.colorscheme = "onedark"
vim.g.onedark_transparent_background = false
vim.g.onedark_style = "deep"

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.quit_on_open = 1

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.rainbow.enable = true

lvim.builtin.telescope.defaults.prompt_prefix = "❯ "
lvim.builtin.telescope.defaults.selection_caret = ">"
lvim.builtin.telescope.defaults.layout_config.width = 0.9
lvim.builtin.telescope.defaults.file_ignore_patterns = { "NvimTree", "node_modules" }

require("linters")
require("which")
require("dashboard")

lvim.plugins = {
	{
		"navarasu/onedark.nvim",
	},
	{
		"styled-components/vim-styled-components",
	},
	{
		"blackCauldron7/surround.nvim",
		config = function()
			require("surround").setup({})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
	},
	{
		"p00f/nvim-ts-rainbow",
	},
	{
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				height = 14,
				auto_close = true,
				action_keys = { -- key mappings for actions in the trouble list
					-- map to {} to remove a mapping, for example:
					-- close = {},
					close = "q", -- close the list
					cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
					refresh = "r", -- manually refresh
					jump_close = { "<cr>", "<tab>", "l" }, -- jump to the diagnostic or open / close folds
					open_split = { "<c-x>" }, -- open buffer in new split
					open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
					open_tab = { "<c-t>" }, -- open buffer in new tab
					jump = { "o" }, -- jump to the diagnostic and close the list
					toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
					toggle_preview = "P", -- toggle auto_preview
					hover = "K", -- opens a small popup with the full multiline message
					preview = "p", -- preview the diagnostic location
					close_folds = { "zM", "zm" }, -- close all folds
					open_folds = { "zR", "zr" }, -- open all folds
					toggle_fold = { "zA", "za" }, -- toggle fold of current file
					previous = "k", -- preview item
					next = "j", -- next item
				},
			})
		end,
	},
}
