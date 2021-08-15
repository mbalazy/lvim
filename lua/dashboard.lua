lvim.builtin.dashboard.active = true
lvim.builtin.dashboard.custom_section = {
      a = {
        description = { "  Recently Used Files" },
        command = "Telescope oldfiles",
      },
      c = {
        description = { "  Load Last Session  " },
        command = "SessionLoad",
      },
      e = {
        description = { "  Save Curr Session  " },
        command = "SessionSave",
      },
      i = {
        description = { "  Find File          " },
        command = "Telescope find_files",
      },
      k = {
        description = { "  Find Word          " },
        command = "Telescope live_grep",
      },
}
