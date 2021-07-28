
lvim.plugins = {
  {
    "navarasu/onedark.nvim"
  },
  {"rmagatti/auto-session",
    config = function()
      require('auto-session').setup {
          auto_save_enabled = false,
          auto_restore_enabled = true,
      }
        end
  },
  {
  'rmagatti/session-lens',
  config = function()
    require('session-lens').setup {
        path_display={'shorten'},
      }
  end
  },
  {
    'styled-components/vim-styled-components'
  },
  -- {
  --   "kevinhwang91/nvim-bqf",
  --   event = "BufRead",
  -- },
}


-- general

vim.cmd("set number relativenumber")

lvim.format_on_save = false
lvim.lint_on_save = false

lvim.leader = "space"
lvim.colorscheme = "onedark"
vim.g.onedark_style = 'deep'

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.width = 50
lvim.builtin.nvimtree.quit_on_open = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Leader bindings for WhichKey
lvim.builtin.which_key.mappings.c = { "<cmd>q!<CR>", "Quit" }
lvim.builtin.which_key.mappings.h = nil
lvim.builtin.which_key.mappings.n = { ":noh<CR>", "Clear search" }
lvim.builtin.which_key.mappings.q = { "<cmd>BufferClose!<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings[":"] = { "<cmd>Telescope command_history<cr>", "Commands history" }
lvim.builtin.which_key.mappings.r = { "<cmd>Telescope registers<cr>", "Registers" }

-- Buffers
lvim.builtin.which_key.mappings.b.e = nil
lvim.builtin.which_key.mappings.b.D = nil
lvim.builtin.which_key.mappings.b.a = { "<cmd>BufferCloseAllButCurrent<cr>", "Close all but current buffer" }
lvim.builtin.which_key.mappings.b.j = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all buffers to the left" }
lvim.builtin.which_key.mappings.b.k = { "<cmd>BufferCloseBuffersRight<cr>", "Close all buffers to the right" }
lvim.builtin.which_key.mappings.b.l = { "<cmd>BufferMoveNext<cr>", "Move buffer next" }
lvim.builtin.which_key.mappings.b.h = { "<cmd>BufferMovePrev<cr>", "Move buffer prev" }

-- Treesitter
lvim.builtin.which_key.mappings["T"] = nil
lvim.builtin.which_key.mappings["t"] = {
    name = "Treesitter",
      u = { ":TSUpdate<cr>", "Update" },
      i = { ":TSConfigInfo<cr>", "Info" },
}

-- Search
lvim.builtin.which_key.mappings.s.q = { "<cmd>Telescope quickfix<cr>", "Quickfix" }
lvim.builtin.which_key.mappings.s.f = { "<cmd>Telescope live_grep<cr>", "Live grep files" }
lvim.builtin.which_key.mappings.s.b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Grep buffers" }
lvim.builtin.which_key.mappings.s.m = { "<cmd>Telescope marks<cr>", "Marks" }
lvim.builtin.which_key.mappings.s.s = { "<cmd>Telescope session-lens search_session<cr>", "Search session" }
lvim.builtin.which_key.mappings.s.c = nil
lvim.builtin.which_key.mappings.s.t = nil
lvim.builtin.which_key.mappings.s.h = nil
lvim.builtin.which_key.mappings.s.k = nil
lvim.builtin.which_key.mappings.s.p = nil
lvim.builtin.which_key.mappings.s.R = nil
lvim.builtin.which_key.mappings.s.M = nil

lvim.builtin.which_key.mappings.l.l = nil

lvim.builtin.telescope.defaults.prompt_prefix = "❯ "
lvim.builtin.telescope.defaults.selection_caret = "> "

lvim.keys.normal_mode = {
  -- Disable Move current line / block with Alt-j/k ala vscode.
  { "<A-j>", "" },
  { "<A-k>", "" },

  -- Better window movement
  { "<M-h>", "<C-w>h", { silent = true } },
  { "<M-j>", "<C-w>j", { silent = true } },
  { "<M-k>", "<C-w>k", { silent = true } },
  { "<M-l>", "<C-w>l", { silent = true } },

  -- Split windows
  { "<M-s>", "<C-w>s", { silent = true } },
  { "<M-v>", "<C-w>v", { silent = true } },

  -- Rotate, open/expand, close windows
  { "<M-r>", "<C-w>r", { silent = true } },
  { "<M-o>", "<C-w>o", { silent = true } },
  { "<M-c>", "<C-w>c", { silent = true } },

  -- Resize with arrows
  { "<C-k>", ":resize -2<CR>" },
  { "<C-j>", ":resize +2<CR>" },
  { "<C-l>", ":vertical resize -2<CR>" },
  { "<C-h>", ":vertical resize +2<CR>" },

  -- QuickFix
  { "]q", ":cnext<CR>" },
  { "[q", ":cprev<CR>" },
  { "<C-q>", ":call QuickFixToggle()<CR>" },
}

-- if you just want to augment the existing ones then use the utility function
-- require("utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })
-- you can also use the native vim way directly

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

