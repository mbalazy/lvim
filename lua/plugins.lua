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
    "HiPhish/nvim-ts-rainbow2",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
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
    'tiagovla/tokyodark.nvim'
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  { "David-Kunz/jester" },
}
