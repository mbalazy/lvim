require("plugins")
-- vim.lsp.set_log_level("debug")
vim.g.skip_ts_context_commentstring_module = true

require("bufferline").setup {
  options = {
    -- enable = false,
    buffer_close_icon = 'x',
    close_icon = '',
  }
}

vim.cmd("set number relativenumber")
vim.cmd("set timeoutlen=150")
vim.cmd("set viminfo='100,<50,s10,h,%")
vim.opt.scrolloff = 16

-- vim.cmd([[command! -nargs=0 Session :lua MiniSessions.read()]])
vim.cmd([[command! -nargs=0 GoToFile :Telescope find_files]])
vim.cmd([[command! -nargs=0 GoToCommand :Telescope commands]])
vim.cmd([[command! -nargs=0 FindFile :Telescope live_grep]])

vim.cmd('highlight clear CursorLine')
vim.cmd('highlight clear CursorLineNR')

lvim.format_on_save = false
lvim.leader = "space"
lvim.colorscheme = 'catppuccin'

-- require("mason-lspconfig").setup {
--   ensure_installed = {},
-- }
require("cmpMappings")

require("linters")
require("which")

require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {
    light = "latte",
    dark = "latte",
  },
  transparent_background = true, -- disables setting the background color.
})

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.width = 46
lvim.builtin.nvimtree.setup.view.float.enable = false
lvim.builtin.nvimtree.setup.view.float.open_win_config = {
  relative = "win",
  border = "rounded",
  width = 54,
  height = 32,
  -- bufpos={50,10}
  row = 3,
  col = 3,
}

-- lvim.builtin.nvimtree.setup.view.float.open_win_config.width = 110
-- lvim.builtin.nvimtree.setup.view.float.open_win_config.height = 40
-- lvim.builtin.nvimtree.setup.view.float.open_win_config.col = 20
-- lvim.builtin.nvimtree.setup.view.float.open_win_config.row = 3

lvim.builtin.nvimtree.setup.reload_on_bufenter = true
lvim.builtin.nvimtree.setup.auto_reload_on_write = true
require("telescope").load_extension("package_info")

lvim.builtin.alpha.dashboard.section.buttons.entries = {
  { "s", lvim.icons.ui.Code .. "  Sessions",        "<CMD>SessionManager<CR>" },
  { "f", lvim.icons.ui.FindFile .. "  Find File",   "<CMD>Telescope find_files<CR>" },
  { "g", lvim.icons.ui.FindText .. "  Grep By",     "<CMD>Telescope live_grep<CR>" },
  { "n", lvim.icons.ui.NewFile .. "  New File",     "<CMD>ene!<CR>" },
  { "p", lvim.icons.ui.Project .. "  Projects ",    "<CMD>Telescope projects<CR>" },
  { "r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
}

local config = require('session_manager.config')
require('session_manager').setup({
  autoload_mode = { config.AutoloadMode.GitSession, config.AutoloadMode.CurrentDir }, -- Define what to do when Neovim is started without arguments. See "Autoload mode" section below.
  autosave_last_session = true,                                                       -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true,                                                  -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  -- autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
  -- autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
  --   'gitcommit',
  --   'gitrebase',
  -- },
  -- autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
  -- autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  -- max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})

local actions = require("lvim.utils.modules").require_on_exported_call "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions

lvim.builtin.telescope = {
  active = true,
  defaults = {
    path_display = { "truncate" },
    -- layout_strategy = "vertical",
    -- layout_strategy = "horizontal",
    layout_strategy = "flex",
    layout_config = {
      flip_columns = 130,
      width = 0.85,
      height = 0.88,
      preview_cutoff = 20,
      horizontal = {
        preview_width = 0.5,
      },
      prompt_position = "bottom",
    },
    mappings = {
      n = {
        ["q"] = actions.close,
        ["h"] = fb_actions.goto_parent_dir,
        ["l"] = actions.select_default,
        ["u"] = fb_actions.toggle_respect_gitignore,
        ["U"] = fb_actions.toggle_hidden,
        ["F"] = fb_actions.toggle_browser,
        ["f"] = function()
          require('telescope.builtin').git_files()
        end
      },
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

lvim.builtin.telescope.defaults.prompt_prefix = "  "
lvim.builtin.telescope.defaults.selection_caret = "> "
-- lvim.builtin.telescope.defaults.file_ignore_patterns = { "NvimTree", ".yarn" }
--
require 'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    -- disable = { 'jsx', 'cpp' },
    -- Which query to use for finding delimiters
    -- query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    -- strategy = require('ts-rainbow').strategy.global,
  },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "json", "dockerfile", "tsx", "vue" },
}

lvim.lsp.installer.setup.automatic_installation.exclude = { 'tsserver' }

-- section_separators = { left = '', right = '' },

vim.cmd("set cmdheight=0")
local function searchCount()
  local search = vim.fn.searchcount({ maxcount = 0 }) -- maxcount = 0 makes the number not be capped at 99
  local searchCurrent = search.current
  local searchTotal = search.total

  if searchCurrent > 0 then
    return "/" .. vim.fn.getreg("/") .. " [" .. searchCurrent .. "/" .. searchTotal .. "]"
  else
    return ""
  end
end

local package_info = require("package-info")

local function getPackageInfoStatus()
  return package_info.get_status()
end

-- local components = require("lvim.core.lualine.components")

-- lvim.builtin.lualine.winbar = {
--   lualine_a = { {
--     'buffers',
--     section_separators = { left = '', right = '' },
--   },
--   },
-- }

lvim.builtin.lualine.sections.lualine_b = { 'branch', 'diff' }
lvim.builtin.lualine.options.section_separators = { left = '', right = '' }

lvim.builtin.lualine.sections.lualine_c = {
  { "filename", file_status = true, newfile_status = false, path = 3, shorting_target = 30 },
}
lvim.builtin.lualine.sections.lualine_x = { 'diagnostics', { searchCount } }
lvim.builtin.lualine.sections.lualine_y = {
  'location',
  { getPackageInfoStatus }
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

require('package-info').setup(
  {
    colors = {
      up_to_date = "#3C4048", -- Text color for up to date dependency virtual text
      outdated = "#d19a66",   -- Text color for outdated dependency virtual text
    },
    icons = {
      enable = true, -- Whether to display icons
      style = {
        up_to_date = "|  ", -- Icon for up to date dependencies
        outdated = "|  ", -- Icon for outdated dependencies
      },
    },
    autostart = true,               -- Whether to autostart when `package.json` is opened
    hide_up_to_date = true,         -- It hides up to date versions when displaying virtual text
    hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
    -- Can be `npm`, `yarn`, or `pnpm`. Used for `delete`, `install` etc...
    -- The plugin will try to auto-detect the package manager based on
    -- `yarn.lock` or `package-lock.json`. If none are found it will use the
    -- provided one, if nothing is provided it will use `yarn`
    package_manager = "npm"
  }
)

require("lint-node").setup({
  command = "npm run lint:cmd", -- or any other command
  key = "t",
  debug = true
})

-- Call the setup function
require("pair-ls").setup({
  -- The pair-ls command to run
  cmd = { "pair-ls", "lsp", "-port", "8080" },

  -- The function configures the root directory for the server
  root_dir = function(fname, util)
    return util.root_pattern(".git", ".hg")(fname) or vim.loop.cwd()
  end,

  -- Pass a function here to run custom logic on attach
  on_attach = function(client, bufnr) end,

  -- See :help vim.lsp.start_client
  flags = {
    allow_incremental_sync = true,
    debounce_text_changes = nil,
  },
})

-- load snippets
-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/" } })
