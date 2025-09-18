-- lua/plugins/dotnet.lua

return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- ... your existing lspconfig, mason, and cmp setup ...

      -- Configure csharp-ls
      require('lspconfig').csharp_ls.setup({
        -- ... your capabilities and other on_attach functions ...
      })

      -- Keymaps for LSP actions
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover' })
      vim.keymap.set('n', '<space>lr', '<cmd>LspRestart<cr>', { desc = 'LSP: Restart' })
      -- ... your other keymaps ...

      ----------------------------------------------------------------------
      -- PLACE THE AUTOCMD AND FORMAT KEYMAP HERE
      ----------------------------------------------------------------------
      vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format() end, { desc = 'Format Code' })

      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.cs',
        callback = function()
          vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
        end,
        desc = 'Format C# files on save',
      })
      ----------------------------------------------------------------------

      end
    },
  -- ... your other plugins like dap, neotest, etc. ...
}
