return {
	-- "EdenEast/nightfox.nvim",
  -- "rijulpaul/nightblossom.nvim",
  -- "shaunsingh/moonlight.nvim",
  -- enabled = false,
   -- "baliestri/aura-theme",
  -- name = "nightblossom",
  "oonamo/ef-themes.nvim",
  lazy = false,
  priority = 1000,
  config = function()
   -- vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
   -- vim.cmd([[colorscheme aura-dark]])
  -- end
    -- This command sets the colorscheme when Neovim starts
   vim.cmd.colorscheme("ef-bio")
  end,
}

