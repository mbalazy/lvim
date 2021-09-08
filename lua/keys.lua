lvim.keys.normal_mode = {
  ["<C-_>"] = "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy='ascending'})<cr>",

--   -- Better window movement
--   [ "<M-h>"] = "<C-w>h",
--   [ "<M-j>"] = "<C-w>j",
--   [ "<M-k>" ] = "<C-w>k",
--   [ "<M-l>" ] = "<C-w>l",

--   -- Split windows
--   [ "<M-s>" ] = "<C-w>s",
--   [ "<M-v>" ] = "<C-w>v",

--   -- Rotate, open/expand, close windows
--   [ "<M-r>" ] = "<C-w>r",
--   [ "<M-o>" ] = "<C-w>o",
--   [ "<M-c>" ] = "<C-w>c",

  -- Resize
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

--   ["<A-h>"] = "<Left>",
--   ["<A-l>"] = "<Right>",
--   ["<A-j>"] = "<Down>",
--   ["<A-k>"] = "<Up>",

--   ["<A-H>"] = "<C-Left>",
--   ["<A-L>"] = "<C-Right>",

  -- navigation
  -- ["<A-Up>"] = "<C-\\><C-N><C-w>k",
  -- ["<A-Down>"] = "<C-\\><C-N><C-w>j",
  -- ["<A-Left>"] = "<C-\\><C-N><C-w>h",
  -- ["<A-Right>"] = "<C-\\><C-N><C-w>l",
  -- navigate tab completion with <c-j> and <c-k>
  -- runs conditionally
  ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
  ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
}
