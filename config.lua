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
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.setup.reload_on_bufenter = true
-- lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.rainbow.enable = true

lvim.builtin.telescope.defaults.prompt_prefix = "❯ "
lvim.builtin.telescope.defaults.selection_caret = ">"
lvim.builtin.telescope.defaults.layout_config.width = 0.9
lvim.builtin.telescope.defaults.file_ignore_patterns = { "NvimTree", "node_modules", ".yarn" }

-- automatically close the tab/vim when nvim-tree is the last window in the tab
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})

-- load snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/package.json" } })



require("nvim-gps").setup()

require("linters")
require("which")
require("lspTs")
require("cmpMappings")

lvim.plugins = {
	{
		"nvim-telescope/telescope-file-browser.nvim",
	},
	{
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	},
	{
		"navarasu/onedark.nvim",
	},
	{
		"jose-elias-alvarez/nvim-lsp-ts-utils",
	},
	{ "tpope/vim-surround" },
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
	},
	{
		"p00f/nvim-ts-rainbow",
	},
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "info",
			})
		end,
	},
}
