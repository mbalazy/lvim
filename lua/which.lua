lvim.keys.insert_mode["kj"] = "<Esc>"
lvim.builtin.which_key.mappings[":"] = { "<cmd>Telescope command_history<cr>", "Commands history" }
lvim.builtin.which_key.mappings.x = { "<cmd>tabc<CR>", "Close tab" }

lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"

lvim.keys.normal_mode["≤"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["≥"] = ":BufferLineMoveNext<CR>"


lvim.lsp.buffer_mappings.normal_mode['K'] = { ":lua require('pretty_hover').hover()<cr>", "Hover" }

lvim.builtin.which_key.mappings.B = { "<cmd>Telescope buffers<cr>", "Find buffer" }

-- Git files instead of find_files
lvim.builtin.which_key.mappings.f = { "<cmd>Telescope git_files show_untracked=true<cr>", "Find File" }
lvim.builtin.which_key.mappings.n = { ":noh<CR>", "Clear search" }
lvim.builtin.which_key.mappings.q = { "<cmd>BufferKill<CR>", "Close Buffer" }


-- Lsp
lvim.lsp.buffer_mappings.normal_mode['gr'] = { "<cmd>Trouble lsp_references<cr>", "Go to reference" }
lvim.builtin.which_key.mappings.l.a = { "<cmd>TSToolsRemoveUnused<cr>", "Remove unused variables" }
lvim.builtin.which_key.mappings.l.O = { "<cmd>TSToolsAddMissingImports<cr>", "Add missint imports" }
lvim.builtin.which_key.mappings.l.o = { "<cmd>TSToolsOrganizeImports<cr>", "Organize imports" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TSToolsRenameFile<cr>", "Change file path" }
lvim.builtin.which_key.mappings.l.c = { "<cmd>TSToolsRemoveUnusedImports<cr>", "Remove unused imports" }
lvim.builtin.which_key.mappings.l.F = { "<cmd>TSToolsFixAll<cr>", "Fix all" }
lvim.builtin.which_key.mappings.l.d = { "<cmd>TSToolsGoToSourceDefinition<cr>", "Go to source definition" }

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
  t = { "<cmd>Trouble<cr>", "TroubleToggle" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  i = { "<cmd>Trouble lsp_implementations<cr>", "Implementations" },
  d = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
  p = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Document diagnostics" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Workspace diagnostics" },
}


lvim.builtin.which_key.mappings["<Space>"] = {
  name = "Harpoon",
  a = { ":lua require('harpoon.mark').add_file()<cr>", "Add file" },
  o = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "List files" },
  k = { ":lua require('harpoon.ui').nav_next() <cr>", "Next" },
  j = { ":lua require('harpoon.ui').nav_prev() <cr>", "Prev" },
  s = { ":Telescope harpoon marks<cr>", "Search marks" },
}

-- Search
lvim.builtin.which_key.mappings.e = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true initial_mode=normal<cr>",
  "Explorer" }
lvim.builtin.which_key.mappings.E = { "<cmd>NvimTreeToggle<cr>", "NvimTree" }

lvim.builtin.which_key.mappings.s.q = { "<cmd>Telescope quickfix<cr>", "Quickfix list" }
lvim.builtin.which_key.mappings.s.f = { "<cmd>Telescope live_grep<cr>", "Grep files" }
lvim.builtin.which_key.mappings.s.r = { "<cmd>Telescope lsp_references show_line=false<cr>", "Grep References" }
lvim.builtin.which_key.mappings.s.F = { "<cmd>Telescope find_files<cr>", "Find files" }
lvim.builtin.which_key.mappings.s.m = { "<cmd>Telescope marks<cr>", "Marks" }
lvim.builtin.which_key.mappings.s.e = { "<cmd>Telescope file_browser<cr>", "File browser" }
lvim.builtin.which_key.mappings.s['/'] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Grep current buffer" }
lvim.builtin.which_key.mappings.s['?'] = { "<cmd>Telescope current_buffer_fuzzy_find default_text=console.log<cr>", "Grep for console.log" }
lvim.builtin.which_key.mappings.s.s = { "<cmd>Telescope persisted<cr>", "Grep sessions" }
lvim.builtin.which_key.mappings.s.P = { "<cmd>Telescope projects<cr>", "Find in projects" }
lvim.builtin.which_key.mappings.s.p = { "<cmd>Telescope find_files default_text=package<cr>", "Find for package.json" }
lvim.builtin.which_key.mappings.s.S = { "<cmd>Telescope grep_string<cr>", "Grep strig" }
lvim.builtin.which_key.mappings.s.t = nil
-- lvim.builtin.which_key.mappings.s.k = nil

-- LunarVim
-- lvim.builtin.which_key.mappings.L.q = { "<cmd>NvimTreeRefresh<cr>", "Refresh NvimTree" }
lvim.builtin.which_key.mappings.L.n = { "<cmd>set rnu!<cr>", "Toggle relative numbers" }
lvim.builtin.which_key.mappings.L.R = { "<cmd>NvimTreeRefresh<cr>", "Refresh NvimTree" }

lvim.builtin.which_key.mappings["v"] = {
  name = "Search and replace",
  f = { ":%s/", "Find each occurrence" },
}

lvim.builtin.which_key.mappings["i"] = {
  name = "Package Info",
  u = { ":PackageInfoUpdate<cr>", "Update" },
  d = { ":PackageInfoDelete<cr>", "Delete" },
  i = { ":PackageInfoInstall<cr>", "Install" },
  c = { ":PackageInfoChangeVersion<cr>", "Change version" },
  s = { ":Telescope package_info<cr>", "Search by Telescope" },
}

-- Git
lvim.builtin.which_key.mappings.g.a = { "<cmd>AdvancedGitSearch<cr>", "Advanced Search" }
lvim.builtin.which_key.mappings.g.S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr><cr>", "Stage Buffer" }
lvim.builtin.which_key.mappings.g.f = { "<cmd>Telescope git_status<cr>", "Git status" }
lvim.builtin.which_key.mappings.g.F = { "<cmd>Telescope git_stash<cr>", "Git stash" }
lvim.builtin.which_key.mappings.g.d = {
  name = "Diffview",
  a = { "<cmd>DiffviewOpen<cr>", "Open    Diffview (merge conflicts)" },
  d = { "<cmd>DiffviewOpen master..HEAD<cr>", "Compare HEAD to master (Diffview)" },
  e = { "<cmd>DiffviewFileHistory %<cr>", "Browse  commits on this file (Diffview)" },
  f = { "<cmd>Telescope git_bcommits<cr>", "Find    commits on this file (Telescope)" },
}
lvim.builtin.which_key.mappings.g.x = { "<cmd>DiffviewClose<cr>", "Close Diffview" }
lvim.builtin.which_key.mappings.g.P = { "<cmd>Git push<cr>", "Git push" }

lvim.lsp.buffer_mappings.normal_mode[':'] = { "<cmd>FineCmdline<cr>", "Cmd line" }

lvim.builtin.which_key.mappings["c"] = {
  name = "ChatGPT",
  c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
  C = { "<cmd>ChatGPTCompleteCode<CR>", "Complete code" },
  A = { "<cmd>ChatGPTActAs<CR>", "Act as" },
  e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
  g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
  t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
  k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
  d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
  a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
  o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
  s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
  f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
  x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
  r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
  l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
}
