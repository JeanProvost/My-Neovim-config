-- lua/plugins/statusline.lua

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        -- The theme in the image is tokyonight
        theme = 'tokyonight', 
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
    })
  end,
}

