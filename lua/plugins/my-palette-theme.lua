
-- lua/plugins/my-cyberpunk-theme.lua

return {
  "roobert/palette.nvim",
  lazy = false,
  enabled = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark"

    require("palette").setup({
      -- 1. DEFINE YOUR COLOR PALETTE
      palette = {
        bg        = "#0f0f18", -- deep dark background
        fg        = "#e0e0e0", -- light gray for general text
        comment   = "#6b6b83", -- muted purple/gray
        red       = "#ff2d55", -- neon red/pink
        orange    = "#ff9f0a", -- neon orange
        yellow    = "#f7f300", -- main bright neon yellow
        green     = "#32ff6a", -- neon green
        cyan      = "#0ff0fc", -- neon cyan
        blue      = "#5a8dee", -- neon blue
        purple    = "#b55eff", -- neon purple
      },

      -- 2. DEFINE HIGHLIGHT GROUPS
      highlights = {
        Normal       = { fg = "fg", bg = "bg" },
        Comment      = { fg = "comment" },
        Error        = { fg = "red", bg = "bg" },
        Identifier   = { fg = "yellow" },
        Function     = { fg = "cyan" },
        Statement    = { fg = "purple" },
        Constant     = { fg = "orange" },
        Type         = { fg = "blue" },
        PreProc      = { fg = "green" },
        Special      = { fg = "red" },
        LineNr       = { fg = "comment" }, -- line numbers
        CursorLineNr = { fg = "yellow" },  -- current line number highlight
        Visual       = { bg = "#1a1a2e" }, -- selection highlight
        Pmenu        = { fg = "fg", bg = "#1b1b2a" }, -- popup menu
        PmenuSel     = { fg = "bg", bg = "yellow" },
      },
    })
    vim.cmd([[colorscheme palette]])
  end,
}

