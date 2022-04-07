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
-- require("dashboard")


lvim.plugins = {
	{
		"navarasu/onedark.nvim",
	},
	{
		"jose-elias-alvarez/nvim-lsp-ts-utils",
	},
	-- {
	-- 	"styled-components/vim-styled-components",
	-- },
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
	-- {
	-- 	"folke/trouble.nvim",
	-- 	requires = "kyazdani42/nvim-web-devicons",
	-- 	config = function()
	-- 		require("trouble").setup({
	-- 			height = 14,
	-- 			auto_close = true,
	-- 			action_keys = { -- key mappings for actions in the trouble list
	-- 				-- map to {} to remove a mapping, for example:
	-- 				-- close = {},
	-- 				close = "q", -- close the list
	-- 				cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
	-- 				refresh = "r", -- manually refresh
	-- 				jump_close = { "<cr>", "<tab>", "l" }, -- jump to the diagnostic or open / close folds
	-- 				open_split = { "<c-x>" }, -- open buffer in new split
	-- 				open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
	-- 				open_tab = { "<c-t>" }, -- open buffer in new tab
	-- 				jump = { "o" }, -- jump to the diagnostic and close the list
	-- 				toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
	-- 				toggle_preview = "P", -- toggle auto_preview
	-- 				hover = "K", -- opens a small popup with the full multiline message
	-- 				preview = "p", -- preview the diagnostic location
	-- 				close_folds = { "zM", "zm" }, -- close all folds
	-- 				open_folds = { "zR", "zr" }, -- open all folds
	-- 				toggle_fold = { "zA", "za" }, -- toggle fold of current file
	-- 				previous = "k", -- preview item
	-- 				next = "j", -- next item
	-- 			},
	-- 		})
	-- 	end,
	-- },
}

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
	-- Needed for inlayHints. Merge this table with your settings or copy
	-- it from the source if you want to add your own init_options.
	init_options = require("nvim-lsp-ts-utils").init_options,
	--
	on_attach = function(client, bufnr)
		local ts_utils = require("nvim-lsp-ts-utils")

		-- defaults
		ts_utils.setup({
			debug = false,
			disable_commands = false,
			enable_import_on_completion = false,

			-- import all
			import_all_timeout = 5000, -- ms
			-- lower numbers = higher priority
			import_all_priorities = {
				same_file = 1, -- add to existing import statement
				local_files = 2, -- git files or files with relative path markers
				buffer_content = 3, -- loaded buffer content
				buffers = 4, -- loaded buffer names
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,

			-- filter diagnostics
			filter_out_diagnostics_by_severity = {},
			filter_out_diagnostics_by_code = {},

			-- inlay hints
			auto_inlay_hints = false,
			inlay_hints_highlight = "Comment",

			-- update imports on file move
			update_imports_on_move = false,
			require_confirmation_on_move = false,
			watch_dir = nil,
		})

		-- required to fix code action ranges and filter diagnostics
		ts_utils.setup_client(client)

		-- no default maps, so you may want to define some here
		local opts = { silent = true }
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
	end,
})

-- require("lspconfig").tsserver.setup({
--     on_attach = function(client)
--         client.resolved_capabilities.document_formatting = false
--         client.resolved_capabilities.document_range_formatting = false
--     end,
-- })

local null_ls = require("null-ls")
-- null_ls.setup({
-- 	sources = {
-- 		null_ls.builtins.diagnostics.eslint_d, -- eslint or eslint_d
-- 		null_ls.builtins.code_actions.eslint_d, -- eslint or eslint_d
-- 		null_ls.builtins.formatting.prettierd, -- prettier, eslint, eslint_d, or prettierd
-- 	},
-- })

-- null_ls.setup({
-- 	sources = {
-- 		null_ls.builtins.diagnostics.eslint.with({
-- 			prefer_local = "node_modules/.bin",
-- 		}),
-- 	},
-- })
