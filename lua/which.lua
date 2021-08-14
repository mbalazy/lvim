-- Additional Leader bindings for WhichKey
lvim.builtin.which_key.mappings.c = { "<cmd>q!<CR>", "Quit" }
lvim.builtin.which_key.mappings.C = { ":SaveSession<cr> | :q!<CR>", "Save Session and Quit" }
lvim.builtin.which_key.mappings.h = nil
lvim.builtin.which_key.mappings.n = { ":noh<CR>", "Clear search" }
lvim.builtin.which_key.mappings.q = { "<cmd>BufferClose!<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings[":"] = { "<cmd>Telescope command_history<cr>", "Commands history" }

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
lvim.builtin.which_key.mappings.s.m = { "<cmd>Telescope marks<cr>", "Marks" }
lvim.builtin.which_key.mappings.s.c = { "<cmd>Telescope git_commits<cr>", "All Commits" }
lvim.builtin.which_key.mappings.s.s = { "<cmd>Telescope session-lens search_session<cr>", "Sessions" }
lvim.builtin.which_key.mappings.s.c = { "<cmd>Telescope git_files<cr>", "Git files" }
lvim.builtin.which_key.mappings.s.p = { ":lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
lvim.builtin.which_key.mappings.s.i = { "<cmd>Telescope commands<cr>", "Commands" }
lvim.builtin.which_key.mappings.s.e = { "<cmd>Telescope file_browser<cr>", "File browser" }
lvim.builtin.which_key.mappings.s.C = nil
lvim.builtin.which_key.mappings.s.h = nil
lvim.builtin.which_key.mappings.s.b = nil
lvim.builtin.which_key.mappings.s.t = nil
lvim.builtin.which_key.mappings.s.k = nil
lvim.builtin.which_key.mappings.s.M = nil

-- Git
lvim.builtin.which_key.mappings.g.o = { "<cmd>Telescope git_status<cr>", "Git status" }
lvim.builtin.which_key.mappings.g.S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr><cr>", "Stage Buffer" }
