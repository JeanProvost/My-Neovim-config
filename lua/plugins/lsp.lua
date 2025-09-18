-- lua/plugins/lsp.lua

return {
  -- This file now returns a list of plugins, each in its own table.
  -- This makes the configuration more robust and readable.

  -- ## Mason: for installing LSPs ##
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },

  -- ## Mason-LSPConfig: bridge between Mason and lspconfig ##
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 
      'williamboman/mason.nvim', 
      'neovim/nvim-lspconfig',
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'csharp_ls', 'pyright', 'sqlls', 'tsserver', 'gopls' },
      })
    end,
  },

  -- ## LSPConfig: the main configuration for language servers ##
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      
      -- Set up keymaps only when an LSP server is attached
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
	  vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
          local opts = { buffer = ev.buf, silent = true }
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show diagnostics" })
        end,
      })

      -- Loop through servers installed by Mason and set them up
      local servers = require('mason-lspconfig').get_installed_servers()
      for _, server_name in ipairs(servers) do
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end
    end,
  },

  -- ## Autocompletion Engine (nvim-cmp) ##
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'Saghen/blink.cmp', },
    config = function()
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'blink' },
          { name = 'buffer' },
          { name = 'path' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
      })
    end,
  },
}
