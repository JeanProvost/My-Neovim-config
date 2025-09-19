return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = {
        '  ██╗   ██████╗  █████╗ ███╗  ██╗   ██████╗ ██████╗  █████╗ ██╗  ██╗ ██████╗ ████████╗',
        '  ██║   ██╔═══╝ ██╔═╗██╗████╗ ██║   ██╔══██╗██╔══██╗██╔═╗██╗██║  ██║██╔════╝ ╚══██╔══╝',
        '  ██║   ██████╗ ███████║██╔██╗██║   ██████╔╝██████╔╝██║ ██║██║  ██║╚█████╗    ██║   ',
        '╔ ██║   ██╔═══╝ ██╔═╗██║██║╚██╗██║   ██╔═══╝ ██╔══██╗██║ ██║╚██╗██╔╝ ╚═══██╗   ██║   ',
        '╚██╔╝   ██████╗ ██║ ╚██║██║ ╚████║   ██║     ██║  ██╗╚█████╔╝ ╚███╔╝ ██████╔╝   ██║   ',
        ' ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝     ╚═╝   ╚═╝ ╚════╝  ╚═╝  ╚═════╝    ╚═╝   ',
      }

      dashboard.section.buttons.val = {
        dashboard.button('f', '  Find File', '<cmd>Telescope find_files<cr>'),
        dashboard.button('g', '󰈭  Find Word', '<cmd>Telescope live_grep<cr>'),
        dashboard.button('r', '  Recent Files', '<cmd>Telescope oldfiles<cr>'),
        dashboard.button('q', '  Quit', '<cmd>qa<cr>'),
      }

      -- ===================================================================
      -- FIX: The 'fortune' module was removed and replaced with static text.
      -- ===================================================================
      -- local stats = require('alpha.modules.fortune') -- REMOVED
      -- dashboard.section.footer.val = stats() -- REMOVED

      dashboard.section.footer.val = "Calgary, AB  |  " .. os.date('%Y-%m-%d') -- ADDED
      -- ===================================================================

      -- Send the config to alpha
      alpha.setup(dashboard.opts)
    end,
  },
}
