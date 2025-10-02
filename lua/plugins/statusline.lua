-- lua/plugins/statusline.lua

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        -- The theme in the image is tokyonight
        local custom_moonlight = require('lualine.themes.moonlight')

      custom_moonlight.normal.a = { fg = '#1e1e2e', bg = '#a6e3a1', gui = 'bold' } -- Normal
      custom_moonlight.insert.a = { fg = '#1e1e2e', bg = '#89b4fa', gui = 'bold' } -- Insert
      custom_moonlight.visual.a = { fg = '#1e1e2e', bg = '#f38ba8', gui = 'bold' } ustom_moonlight.normal.a = { fg = '#1e1e2e', bg = '#a6e3a1', gui = 'bold' } -- Normal
      custom_moonlight.insert.a = { fg = '#1e1e2e', bg = '#89b4fa', gui = 'bold' } -- Insert
      custom_moonlight.visual.a = { fg = '#1e1e2e', bg = '#f38ba8', gui = 'bold' } 
        icons_enabled = true,
        -- These are the powerline arrow separators
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        -- Added 'diagnostics' and a function to show the current function name
        lualine_c = {
          'diagnostics',
          {
            function()
              return vim.fn.expand('%:t')
            end,
          },
          {
            function()
              local current_function = vim.fn.expand('<sfile>')
              if current_function ~= '' then
                return ' ' .. current_function
              end
              return ''
            end
          }
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      require('lualine').setup({
        options = {
          theme = custom_moonlight,
        },
          })
  end,
}

