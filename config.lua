vim.cmd("set number relativenumber")
-- vim.lsp.set_log_level("debug")
lvim.format_on_save = false
lvim.leader = "space"

lvim.colorscheme = "onedark"

require('onedark').setup {
  style = 'darker'
}
require('onedark').load()

vim.opt.scrolloff = 16

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.setup.view.width = 54
lvim.builtin.nvimtree.setup.reload_on_bufenter = true
lvim.builtin.nvimtree.setup.auto_reload_on_write = true

-- lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
require("telescope").load_extension("persisted")

-- lvim.builtin.treesitter.highlight.enabled = true
-- lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.rainbow.enable = true



lvim.builtin.alpha.dashboard.section.buttons.entries = {
  { "c", lvim.icons.ui.Fire .. "  Current Sessions", "<CMD>SessionLoad<CR>" },
  { "s", lvim.icons.ui.Code .. "  Sessions",         "<CMD>Telescope persisted<CR>" },
  { "f", lvim.icons.ui.FindFile .. "  Find File",    "<CMD>Telescope find_files<CR>" },
  { "n", lvim.icons.ui.NewFile .. "  New File",      "<CMD>ene!<CR>" },
  { "p", lvim.icons.ui.Project .. "  Projects ",     "<CMD>Telescope projects<CR>" },
  { "r", lvim.icons.ui.History .. "  Recent files",  ":Telescope oldfiles <CR>" },
  { "t", lvim.icons.ui.FindText .. "  Find Text",    "<CMD>Telescope live_grep<CR>" },
}

require("nvim-treesitter.configs").setup({
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    -- extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    -- colors = {}, -- table of hex strings
  }
})

require('telescope').setup({
  extensions = {
    persisted = {
      layout_config = { width = 0.55, height = 0.55 }
    }
  }
})

require("persisted").setup({
  save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
  silent = false,                                                   -- silent nvim message when sourcing session file
  use_git_branch = false,                                           -- create session files based on the branch of the git enabled repository
  autosave = true,                                                  -- automatically save session files when exiting Neovim
  should_autosave = nil,                                            -- function to determine if a session should be autosaved
  autoload = true,                                                  -- automatically load the session for the cwd on Neovim startup
  on_autoload_no_session = nil,                                     -- function to run when `autoload = true` but there is no session to load
  follow_cwd = true,                                                -- change session file name to match current working directory if it changes
  allowed_dirs = nil,                                               -- table of dirs that the plugin will auto-save and auto-load from
  ignored_dirs = nil,                                               -- table of dirs that are ignored when auto-saving and auto-loading
  telescope = {                                                     -- options for the telescope extension
    reset_prompt_after_deletion = true,                             -- whether to reset prompt after session deleted
  },
})

lvim.builtin.telescope.defaults.prompt_prefix = "❯ "
lvim.builtin.telescope.defaults.selection_caret = ">"
lvim.builtin.telescope.defaults.layout_config.width = 0.9
lvim.builtin.telescope.defaults.file_ignore_patterns = { "NvimTree", "node_modules", ".yarn" }

local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections.lualine_b = {
  { "filename", file_status = true, newfile_status = false, path = 3, shorting_target = 30 },
  components.branch,
}

lvim.builtin.lualine.sections.lualine_y = {
  components.location,
}

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
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/" } })

require("typescript").setup({})
require("linters")
require("which")
require("cmpMappings")

lvim.plugins = {
  {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  {
    "SmiteshP/nvim-gps",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "olimorris/persisted.nvim",
    config = true
  },
  {
    "navarasu/onedark.nvim",
  },
  {
    "jose-elias-alvarez/typescript.nvim",
  },
  { "tpope/vim-surround" },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  -- { "Pocco81/DAPInstall.nvim", branch = "dev" },
  { "David-Kunz/jester" },
  -- { "rcarriga/nvim-dap-ui" },
}

require("indent_blankline").setup({
  filetype = { "yaml", "yml" },
  show_current_context = false,
  show_trailing_blankline_indent = false,
})
