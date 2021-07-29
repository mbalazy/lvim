
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
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        height = 14,
        auto_close = true,
        action_keys = { -- key mappings for actions in the trouble list
                -- map to {} to remove a mapping, for example:
                -- close = {},
                close = "q", -- close the list
                cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                refresh = "r", -- manually refresh
                jump = {"<cr>", "<tab>", 'l'}, -- jump to the diagnostic or open / close folds
                open_split = { "<c-x>" }, -- open buffer in new split
                open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                open_tab = { "<c-t>" }, -- open buffer in new tab
                jump_close = {"o"}, -- jump to the diagnostic and close the list
                toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                toggle_preview = "P", -- toggle auto_preview
                hover = "K", -- opens a small popup with the full multiline message
                preview = "p", -- preview the diagnostic location
                close_folds = {"zM", "zm"}, -- close all folds
                open_folds = {"zR", "zr"}, -- open all folds
                toggle_fold = {"zA", "za"}, -- toggle fold of current file
                previous = "k", -- preview item
                next = "j" -- next item
            },
      }
    end
  }
  -- {
  --   "kevinhwang91/nvim-bqf",
  --   event = "BufRead",
  -- },
}


-- general
vim.cmd("set number relativenumber")
lvim.lsp.diagnostics.virtual_text = false

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
lvim.builtin.which_key.mappings["T"] = {
    name = "Treesitter",
      u = { ":TSUpdate<cr>", "Update" },
      i = { ":TSConfigInfo<cr>", "Info" },
}

-- Trouble
lvim.builtin.which_key.mappings["t"] = {
    name = "Trouble",
      t = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
      r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
      d = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definitions" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
      e = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document diagnostics" },
      w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace diagnostics" },
}


-- Search
lvim.builtin.which_key.mappings.s.q = { "<cmd>Telescope quickfix<cr>", "Quickfix" }
lvim.builtin.which_key.mappings.s.f = { "<cmd>Telescope live_grep<cr>", "Live grep files" }
lvim.builtin.which_key.mappings.s.b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Grep buffers" }
lvim.builtin.which_key.mappings.s.m = { "<cmd>Telescope marks<cr>", "Marks" }
lvim.builtin.which_key.mappings.s.s = { "<cmd>Telescope session-lens search_session<cr>", "Sessions" }
lvim.builtin.which_key.mappings.s.p = { ":lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
lvim.builtin.which_key.mappings.s.c = nil
lvim.builtin.which_key.mappings.s.t = nil
lvim.builtin.which_key.mappings.s.h = nil
lvim.builtin.which_key.mappings.s.k = nil
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

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

