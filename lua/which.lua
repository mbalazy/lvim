lvim.builtin.which_key.mappings.c = { "<cmd>q!<CR>", "Quit" }
lvim.builtin.which_key.mappings.h = nil

-- Git files instead of find_files
lvim.builtin.which_key.mappings.f = { "<cmd>Telescope git_files<cr>", "Find File" }
lvim.builtin.which_key.mappings.n = { ":noh<CR>", "Clear search" }
lvim.builtin.which_key.mappings.q = { "<cmd>BufferClose!<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings[":"] = { "<cmd>Telescope command_history<cr>", "Commands history" }

-- Lsp
lvim.builtin.which_key.mappings.l.a = { "<cmd>Telescope lsp_code_actions<cr>", "Code action" }
lvim.builtin.which_key.mappings.l.o = { "<cmd>TSLspOrganize<cr>", "Organize imports" }
lvim.builtin.which_key.mappings.l.O = { "<cmd>TSLspImportAll<cr>", "Import all" }

-- Buffers
lvim.builtin.which_key.mappings.b.e = nil
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
	i = { "<cmd>TroubleToggle lsp_implementations<cr>", "Implementations" },
	d = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definitions" },
	q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
	p = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document diagnostics" },
	w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace diagnostics" },
}

-- Search
lvim.builtin.which_key.mappings.s.q = { "<cmd>Telescope quickfix<cr>", "Quickfix list" }
lvim.builtin.which_key.mappings.s.f = { "<cmd>Telescope live_grep<cr>", "Grep files" }
lvim.builtin.which_key.mappings.s.F = { "<cmd>Telescope find_files<cr>", "Find files" }
lvim.builtin.which_key.mappings.s.m = { "<cmd>Telescope marks<cr>", "Marks" }
lvim.builtin.which_key.mappings.s.e = { "<cmd>Telescope file_browser<cr>", "File browser" }
lvim.builtin.which_key.mappings.s.b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Grep buffer" }
lvim.builtin.which_key.mappings.s.p = { "<cmd>Telescope projects<cr>", "Find in projects" }
lvim.builtin.which_key.mappings.s.t = nil
lvim.builtin.which_key.mappings.s.k = nil

-- LunarVim
-- lvim.builtin.which_key.mappings.L.q = { "<cmd>NvimTreeRefresh<cr>", "Refresh NvimTree" }
-- lvim.builtin.which_key.mappings.L.C = { "<cmd>Telescope live_grep cwd=~/.config/lvim<cr>", "Grep in config.lua" }

-- Git
lvim.builtin.which_key.mappings.g.o = { "<cmd>Telescope git_status<cr>", "Git status" }
lvim.builtin.which_key.mappings.g.S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr><cr>", "Stage Buffer" }
