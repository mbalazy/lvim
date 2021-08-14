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
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "p00f/nvim-ts-rainbow",
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
  },
  {
      "vhyrro/neorg",
      config = function()
          require('neorg').setup {
              -- Tell Neorg what modules to load
              load = {
                  ["core.defaults"] = {}, -- Load all the default modules
                  ["core.norg.concealer"] = {}, -- Allows for use of icons
                  ["core.keybinds"] = { -- Configure core.keybinds
                    config = {
                        default_keybinds = true, -- Generate the default keybinds
                    }
                },
                  ["core.norg.dirman"] = { -- Manage your directories with Neorg
                      config = {
                          workspaces = {
                              my_workspace = "~/neorg"
                          }
                      }
                  }
              },
          }
      end,
      after = "nvim-compe",
      requires = "nvim-lua/plenary.nvim"
  }
}


-- general
vim.cmd("set number relativenumber")
lvim.builtin.dashboard.active = true
lvim.builtin.compe.source.neorg = true

lvim.format_on_save = false

lvim.leader = "space"

lvim.colorscheme = "onedark"
vim.g.tokyonight_style = "night"
vim.g.onedark_style = 'deep'

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.width = 50
lvim.builtin.nvimtree.quit_on_open = 1

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.rainbow.enable = true

lvim.builtin.telescope.defaults.prompt_prefix = "❯ "
lvim.builtin.telescope.defaults.selection_caret = ">"
lvim.builtin.telescope.defaults.layout_config.width = 0.9

require('linters')
require('which')
require('keymappings')
