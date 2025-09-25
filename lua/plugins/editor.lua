return {
  {
    'RRethy/vim-illuminate',
    event = 'VeryLazy',
    opts = {
      providers = { 'lsp', 'treesitter' },
      delay = 200,
      filetypes_denylist = { 'NvimTree', 'alpha', 'harpoon' },
    },
    config = function(_, opts)
      require('illuminate').configure(opts)
      local map = vim.keymap.set
      map('n', ']]', function() require('illuminate').goto_next_reference(true) end, { desc = 'Illuminate: Next Reference' })
      map('n', '[[', function() require('illuminate').goto_prev_reference(true) end, { desc = 'Illuminate: Prev Reference' })
    end,
  },

  -- =======================================================================
  -- Plugin: harpoon
  -- Desc: Mark files for quick navigation.
  -- =======================================================================
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup()

      local map = vim.keymap.set
      map('n', '<leader>a', function() harpoon:list():add() end, { desc = 'Harpoon: Mark file' })
      map('n', '<leader>he', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon: Open Menu' })

      -- Keymaps to jump directly to files
      map('n', '<leader>h1', function() harpoon.list():select(1) end, { desc = 'Harpoon: Go to file 1' })
      map('n', '<leader>h2', function() harpoon.list():select(2) end, { desc = 'Harpoon: Go to file 2' })
      map('n', '<leader>h3', function() harpoon.list():select(3) end, { desc = 'Harpoon: Go to file 3' })
      map('n', '<leader>h4', function() harpoon.list():select(4) end, { desc = 'Harpoon: Go to file 4' })
    end,
  },
}
