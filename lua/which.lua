lvim.keys.insert_mode["kj"] = "<Esc>"
lvim.builtin.which_key.mappings[":"] = { "<cmd>Telescope command_history<cr>", "Commands history" }
lvim.builtin.which_key.mappings.c = { "<cmd>q!<CR>", "Quit" }
lvim.builtin.which_key.mappings.h = nil

-- Git files instead of find_files
lvim.builtin.which_key.mappings.f = { "<cmd>Telescope git_files<cr>", "Find File" }
lvim.builtin.which_key.mappings.n = { ":noh<CR>", "Clear search" }
lvim.builtin.which_key.mappings.q = { "<cmd>BufferKill<CR>", "Close Buffer" }

-- Lsp
lvim.builtin.which_key.mappings.l.a = { "<cmd>TypescriptRemoveUnused<cr>", "Remove unused variables" }
lvim.builtin.which_key.mappings.l.O = { "<cmd>TypescriptAddMissingImports<cr>", "Add missint imports" }
lvim.builtin.which_key.mappings.l.o = { "<cmd>TypescriptOrganizeImports<cr>", "Organize imports" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TypescriptRenameFile<cr>", "Change file path" }
lvim.builtin.which_key.mappings.l.c = { "<cmd>TypescriptRemoveUnused<cr>", "Remove unused imports" }
lvim.builtin.which_key.mappings.l.F = { "<cmd>TypescriptFixAll<cr>", "Fix all" }
lvim.builtin.which_key.mappings.l.d = { "<cmd>TypescriptGoToSourceDefinition<cr>", "Go to source definition" }

-- Buffers hjkl
lvim.builtin.which_key.mappings.b.e = nil
lvim.builtin.which_key.mappings.b.n = nil -- next
lvim.builtin.which_key.mappings.b.b = nil -- prev

-- lvim.builtin.which_key.mappings.b.a = { "<cmd>BufferCloseAllButCurrent<cr>", "Close all but current buffer" }
lvim.builtin.which_key.mappings.b.j = { "<cmd>BufferLineMovePrev<cr>", "Move buffer prev" }
lvim.builtin.which_key.mappings.b.k = { "<cmd>BufferLineMoveNext<cr>", "Move buffer next" }
lvim.builtin.which_key.mappings.b.p = { "<cmd>BufferLineTogglePin<cr>", "Toggle pin" }

lvim.builtin.which_key.mappings.b.h = { "<cmd>BufferLineCloseLeft<cr>", "Close all buffers to the left" }
lvim.builtin.which_key.mappings.b.l = { "<cmd>BufferLineCloseRight<cr>", "Close all buffers to the right" }

-- Treesitter
lvim.builtin.which_key.mappings["T"] = {
  name = "Terminal",
  r = { ":TermExec go_back=0 size=16 cmd='rf-lerna release' direction=horizontal <cr>", "Rf-lerna release" },
  t = { ":ToggleTerm size=20 direction=horizontal <cr>", "Toggle terminal" },
  w = { ":TermExec go_back=0 size=20 cmd='gh run watch'  direction=horizontal <cr>", "Gh watch actions" },
}

-- Treesitter
lvim.builtin.which_key.mappings["h"] = {
  name = "Harpoon",
  a = { ":lua require('harpoon.mark').add_file()<cr>", "Add file" },
  o = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Open Menu" },
  k = { ":lua require('harpoon.ui').nav_next() <cr>", "Next" },
  j = { ":lua require('harpoon.ui').nav_prev() <cr>", "Prev" },
  h = { ":Telescope harpoon marks<cr>", "Search marks" },
}

-- Trouble
lvim.builtin.which_key.mappings["t"] = {
  name = "Trouble",
  t = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
  i = { "<cmd>TroubleToggle lsp_implementations<cr>", "Implementations" },
  d = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definitions" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
  p = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document diagnostics" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace diagnostics" },
}

-- Search
lvim.builtin.which_key.mappings.s.q = { "<cmd>Telescope quickfix<cr>", "Quickfix list" }
lvim.builtin.which_key.mappings.s.f = { "<cmd>Telescope live_grep<cr>", "Grep files" }
lvim.builtin.which_key.mappings.s.r = { "<cmd>Telescope lsp_references show_line=false<cr>", "Grep References" }
lvim.builtin.which_key.mappings.s.F = { "<cmd>Telescope find_files<cr>", "Find files" }
lvim.builtin.which_key.mappings.s.m = { "<cmd>Telescope marks<cr>", "Marks" }
lvim.builtin.which_key.mappings.s.e = { "<cmd>Telescope file_browser<cr>", "File browser" }
lvim.builtin.which_key.mappings.s.E = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
  "File browser cur" }
lvim.builtin.which_key.mappings.s.B = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Grep current buffer" }
lvim.builtin.which_key.mappings.s.s = { "<cmd>Telescope buffers<cr>", "Find buffer" }
-- lvim.builtin.which_key.mappings.s.s = { "<cmd>Telescope persisted<cr>", "Grep sessions" }
lvim.builtin.which_key.mappings.s.p = { "<cmd>Telescope projects<cr>", "Find in projects" }
lvim.builtin.which_key.mappings.s.S = { "<cmd>Telescope grep_string<cr>", "Grep strig" }
lvim.builtin.which_key.mappings.s.t = nil
-- lvim.builtin.which_key.mappings.s.k = nil

-- LunarVim
-- lvim.builtin.which_key.mappings.L.q = { "<cmd>NvimTreeRefresh<cr>", "Refresh NvimTree" }
lvim.builtin.which_key.mappings.L.n = { "<cmd>set rnu!<cr>", "Toggle relative numbers" }
lvim.builtin.which_key.mappings.L.R = { "<cmd>NvimTreeRefresh<cr>", "Refresh NvimTree" }

-- builtin vim
lvim.builtin.which_key.mappings["v"] = {
  name = "Search and replace",
  f = { ":%s/", "Find each occurrence" },
}

-- Git
lvim.builtin.which_key.mappings.g.o = { "<cmd>Telescope git_status<cr>", "Git status" }
lvim.builtin.which_key.mappings.g.S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr><cr>", "Stage Buffer" }

-- LunarVim keybindings
lvim.keys.normal_mode["("] = "6j"
lvim.keys.normal_mode[")"] = "6k"

lvim.lsp.buffer_mappings.normal_mode['gr'] = { "<cmd>TroubleToggle lsp_references<cr>",
  "Go to reference" }
