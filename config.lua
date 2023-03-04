vim.cmd("set number relativenumber")
-- vim.lsp.set_log_level("debug")

lvim.format_on_save = false

lvim.leader = "space"

lvim.colorscheme = "horizon"
vim.opt.scrolloff = 16

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
})

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.setup.view.width = 54
lvim.builtin.nvimtree.setup.reload_on_bufenter = true
lvim.builtin.nvimtree.setup.auto_reload_on_write = true

-- lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.rainbow.enable = true

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
require("telescope").load_extension('harpoon')
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
    requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    "navarasu/onedark.nvim",
  },
  {
    "ThePrimeagen/harpoon",
  },
  {
    "lunarvim/horizon.nvim",
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
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "info",
      })
    end,
  },
}

require("indent_blankline").setup({
  filetype = { "yaml", "yml" },
  show_current_context = false,
  show_trailing_blankline_indent = false,
})
