-- general
vim.cmd("set number relativenumber")

lvim.format_on_save = false

lvim.leader = "space"

lvim.colorscheme = "onedark"
require("onedark").setup({
	style = "deep",
})

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.setup.view.width = 50

lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

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


lvim.plugins = {
	{
		"navarasu/onedark.nvim",
	},
	{
		"jose-elias-alvarez/nvim-lsp-ts-utils",
	},
	{
		"ur4ltz/surround.nvim",
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
}
