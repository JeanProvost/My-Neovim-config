return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = "VimEnter",
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    -- Use telescope to search
    { "<leader>ft", "<cmd>ToDoTelescope<cr>", desc = "Find todos (Telescope)" },
  },
  opts = {
        keywords = {
      FIX = {
        icon = " ", -- Nerd Font icon for a bug
        color = "error",
        alt = { "FIXME", "BUG", "ISSUE" },
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARNING = { icon = " ", color = "warning", alt = { "WARN" } },
      PERF = { icon = " ", color = "hint", alt = { "PERFORMANCE", "OPTIM" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
    gui_style = {
      fg = "BOLD",
      bg = "BOLD",
    },
    merge_keywords = true,

    highlight = {
      multiline = true,
      multiline_pattern = "^.",
      multiline_context = 10,
      before = "",
      after = "fg",
      pattern = [[.*<(KEYWORDS)\s*:]],
    },
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },        
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" }
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[\b(KEYWORDS):]],
    }
  }
}
