return {
	-- "EdenEast/nightfox.nvim",
  -- "rijulpaul/nightblossom.nvim",
  "shaunsingh/moonlight.nvim",
  -- name = "nightblossom",
  lazy = false,
  priority = 1000,
  config = function()
    -- This command sets the colorscheme when Neovim starts
    vim.cmd("colorscheme moonlight")
  end,
}

