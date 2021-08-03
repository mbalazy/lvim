lvim.plugins = {
  {
    "navarasu/onedark.nvim"
  },
  {
    'folke/tokyonight.nvim'
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
    "blackCauldron7/surround.nvim",
    config = function()
      require "surround".setup {}
    end
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
-- lvim.lsp.diagnostics.virtual_text = false

lvim.format_on_save = false
lvim.lint_on_save = false

lvim.leader = "space"

lvim.colorscheme = "onedark"
vim.g.tokyonight_style = "night"
vim.g.onedark_style = 'deep'

lvim.builtin.dashboard.active = false
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
lvim.builtin.which_key.mappings.r = { "<cmd>source %<cr>", "Source me" }


-- Lsp
lvim.builtin.which_key.mappings.l.a = { "<cmd>Telescope lsp_code_actions<cr>", "Code action" }

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
      p = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document diagnostics" },
      w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace diagnostics" },
}

-- Search
lvim.builtin.which_key.mappings.s.q = { "<cmd>Telescope quickfix<cr>", "Quickfix list" }
lvim.builtin.which_key.mappings.s.f = { "<cmd>Telescope live_grep<cr>", "Grep files" }
lvim.builtin.which_key.mappings.s.b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Grep in buffer" }
lvim.builtin.which_key.mappings.s.m = { "<cmd>Telescope marks<cr>", "Marks" }
lvim.builtin.which_key.mappings.s.c = { "<cmd>Telescope git_commits<cr>", "All Commits" }
lvim.builtin.which_key.mappings.s.s = { "<cmd>Telescope session-lens search_session<cr>", "Sessions" }
lvim.builtin.which_key.mappings.s.c = { "<cmd>Telescope git_files<cr>", "Git files" }
lvim.builtin.which_key.mappings.s.p = { ":lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
lvim.builtin.which_key.mappings.s.i = { "<cmd>Telescope commands<cr>", "Commands" }
lvim.builtin.which_key.mappings.s.v = { "<cmd>Telescope find_files cwd=~/.config/lvim<cr>", "Lvim" }
lvim.builtin.which_key.mappings.s.e = { "<cmd>Telescope file_browser<cr>", "File browser" }
lvim.builtin.which_key.mappings.s.C = nil
lvim.builtin.which_key.mappings.s.h = nil
lvim.builtin.which_key.mappings.s.t = nil
lvim.builtin.which_key.mappings.s.k = nil
lvim.builtin.which_key.mappings.s.R = nil
lvim.builtin.which_key.mappings.s.M = nil

lvim.builtin.telescope.defaults.layout_config.width = 0.9
-- Git
lvim.builtin.which_key.mappings.g.o = { "<cmd>Telescope git_status<cr>", "Git status" }

lvim.builtin.telescope.defaults.prompt_prefix = "❯ "
lvim.builtin.telescope.defaults.selection_caret = ">"

lvim.keys.normal_mode = {
  -- Disable Move current line / block with Alt-j/k ala vscode.
  [ "<A-j>" ] =  "" ,
  [ "<A-k>" ] =  "" ,

  -- Better window movement
  [ "<M-h>"] = "<C-w>h",
  [ "<M-j>"] = "<C-w>j",
  [ "<M-k>" ] = "<C-w>k",
  [ "<M-l>" ] = "<C-w>l",

  -- Split windows
  [ "<M-s>" ] = "<C-w>s",
  [ "<M-v>" ] = "<C-w>v",

  -- Rotate, open/expand, close windows
  [ "<M-r>" ] = "<C-w>r",
  [ "<M-o>" ] = "<C-w>o",
  [ "<M-c>" ] = "<C-w>c",

  -- Resize with arrows
  [ "<C-k>" ] = ":resize -2<CR>",
  [ "<C-j>" ] = ":resize +2<CR>",
  [ "<C-l>" ] = ":vertical resize -2<CR>",
  [ "<C-h>" ] = ":vertical resize +2<CR>",

  -- QuickFix
  [ "]q" ] = ":cnext<CR>",
  [ "[q" ] = ":cprev<CR>",
  [ "<C-q>" ] = ":call QuickFixToggle()<CR>",

  -- Tab switch buffer
  ["<S-l>"] = ":BufferNext<CR>",
  ["<S-h>"] = ":BufferPrevious<CR>",

}

lvim.keys.insert_mode = {
  ["jk"] = "<ESC>",
  ["kj"] = "<ESC>",
  ["jj"] = "<ESC>",

  ["<A-h>"] = "<Left>",
  ["<A-l>"] = "<Right>",
  ["<A-H>"] = "<C-Left>",
  ["<A-L>"] = "<C-Right>",
  ["<A-j>"] = "<Down>",
  ["<A-k>"] = "<Up>",

  -- navigation
  ["<A-Up>"] = "<C-\\><C-N><C-w>k",
  ["<A-Down>"] = "<C-\\><C-N><C-w>j",
  ["<A-Left>"] = "<C-\\><C-N><C-w>h",
  ["<A-Right>"] = "<C-\\><C-N><C-w>l",
  -- navigate tab completion with <c-j> and <c-k>
  -- runs conditionally
  ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
  ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
}



--
-- Setup formatters for JavaScript family
--
lvim.lang.javascript.formatters = {
  {
    exe = "prettier",
    args = lvim.lang.javascript.formatters[1].args,
  },
}
lvim.lang.typescript.formatters = lvim.lang.javascript.formatters
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.typescriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.vue.formatters = lvim.lang.javascript.formatters
--
-- Setup linters for JavaScript family
--
lvim.lang.javascript.linters = { { exe = "eslint" } }
lvim.lang.typescript.linters = lvim.lang.javascript.linters
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters
lvim.lang.typescriptreact.linters = lvim.lang.javascript.linters
lvim.lang.vue.linters = lvim.lang.javascript.linters
