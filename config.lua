require("plugins")

vim.cmd("set number relativenumber")
vim.cmd("set cmdheight=0")
-- vim.lsp.set_log_level("debug")

lvim.format_on_save = false
lvim.leader = "space"

vim.cmd([[command! -nargs=0 Session :SessionLoad]])

vim.cmd([[command! -nargs=0 GoToFile :Telescope find_files]])
vim.cmd([[command! -nargs=0 GoToCommand :Telescope commands]])
vim.cmd([[command! -nargs=0 FindFile :Telescope live_grep]])

lvim.colorscheme = 'catppuccin-mocha'

require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {
    -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
  term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false,             -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15,           -- percentage of the shade to apply to the inactive window
  },
  no_italic = true, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = {}, -- Change the style of comments
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = false,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})


    -- require("lualine").setup({
    --   sections = {
    --     lualine_x = {
    --       {
    --         require("lazy.status").updates,
    --         cond = require("lazy.status").has_updates,
    --         color = { fg = "ff9e64" },
    --       },
    --     },
    --   },
    -- })


-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- vim.cmd.colorscheme "catppuccin"

-- lvim.transparent_window = true

-- lvim.colorscheme = "tokyodark"

vim.opt.scrolloff = 16

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"

-- lvim.builtin.nvimtree.setup.view.width = 54

lvim.builtin.nvimtree.setup.view.float.enable = true
lvim.builtin.nvimtree.setup.view.float.open_win_config.width = 110
lvim.builtin.nvimtree.setup.view.float.open_win_config.height = 40
lvim.builtin.nvimtree.setup.view.float.open_win_config.col = 20
lvim.builtin.nvimtree.setup.view.float.open_win_config.row = 3

lvim.builtin.nvimtree.setup.reload_on_bufenter = true
lvim.builtin.nvimtree.setup.auto_reload_on_write = true

-- lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
require("telescope").load_extension("persisted")

-- lvim.builtin.treesitter.highlight.enabled = false
-- lvim.builtin.treesitter.autotag.enable = true

lvim.builtin.alpha.dashboard.section.buttons.entries = {
  { "c", lvim.icons.ui.Fire .. "  Current Sessions", "<CMD>SessionLoad<CR>" },
  { "s", lvim.icons.ui.Code .. "  Sessions",         "<CMD>Telescope persisted<CR>" },
  { "f", lvim.icons.ui.FindFile .. "  Find File",    "<CMD>Telescope find_files<CR>" },
  { "n", lvim.icons.ui.NewFile .. "  New File",      "<CMD>ene!<CR>" },
  { "p", lvim.icons.ui.Project .. "  Projects ",     "<CMD>Telescope projects<CR>" },
  { "r", lvim.icons.ui.History .. "  Recent files",  ":Telescope oldfiles <CR>" },
  { "t", lvim.icons.ui.FindText .. "  Find Text",    "<CMD>Telescope live_grep<CR>" },
}

require("telescope").setup {
  extensions = {
    file_browser = {
      grouped = true,
      display_stat = { date = false, size = false, mode = false },
    },
  },
}

lvim.builtin.telescope = {
  active = true,
  defaults = {
    path_display = { "truncate" },
    layout_strategy = "vertical",
    layout_config = {
      width = 0.66,
      height = 0.96,
      preview_cutoff = 20,
      -- preview_width = 0.5,
      prompt_position = "top",
    },
  },
  pickers = {
    git_files = {
      hidden = true,
    },
    live_grep = {
      hidden = true,
    },
  },
}

require("telescope").load_extension "file_browser"

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

lvim.builtin.telescope.defaults.prompt_prefix = "  "
lvim.builtin.telescope.defaults.selection_caret = "> "
-- lvim.builtin.telescope.defaults.file_ignore_patterns = { "NvimTree", ".yarn" }

local components = require("lvim.core.lualine.components")

--
lvim.builtin.lualine.sections.lualine_a = { 'mode' }
lvim.builtin.lualine.options.section_separators = { left = '', right = '' }

-- section_separators = { left = '', right = '' },

lvim.builtin.lualine.sections.lualine_b = { 'branch', 'diff' }

lvim.builtin.lualine.sections.lualine_c = {
  { "filename", file_status = true, newfile_status = false, path = 3, shorting_target = 30 },
}


lvim.builtin.lualine.sections.lualine_y = {
  components.location,
}

local fineline = require('fine-cmdline')
fineline.setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = '  '
  },
  popup = {
    position = {
      row = '24%',
      col = '50%',
    },
    size = {
      width = '50%',
    },
    border = {
      style = 'rounded',
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  },
})

-- automatically close the tab/vim when nvim-tree is the last window in the tab
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end,
})

require("indent_blankline").setup({
  filetype = { "yaml", "yml" },
  show_current_context = false,
  show_trailing_blankline_indent = false,
})

-- load snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/" } })

require("typescript").setup({})
require("cmpMappings")

require("linters")
require("which")
