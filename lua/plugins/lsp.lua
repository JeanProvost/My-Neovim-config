
-- lua/plugins/lsp.lua

return {
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
    },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'csharp_ls', 'pyright', 'lua_ls', 'tsserver', 'gopls' },
      })
    end,
  },

  -- ## nvim-navic: For breadcrumbs ##
  {
    'SmiteshP/nvim-navic',
    event = "VeryLazy",
    opts = {
      lsp = {
        auto_attach = true,
      },
    },
  },

  -- ## LSPConfig: the main configuration for language servers ##
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'SmiteshP/nvim-navic',
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      local navic = require('nvim-navic')

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.server_capabilities.documentSymbolProvider then
            navic.attach(client, ev.buf)
          end

          -- Keymaps for LSP
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'LSP: Hover' })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'LSP: Go to Definition' })
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = 'LSP: Go to References' })
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = 'LSP: Go to Implementation' })
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'LSP: Code Action' })
          vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'LSP: Rename' })
          vim.keymap.set('n', '<leader>cl', '<cmd>LspRestart<cr>', { buffer = ev.buf, desc = 'LSP: Restart' })
          vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end,
            { buffer = ev.buf, desc = 'LSP: Format Code' })
          vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float,
            { buffer = ev.buf, desc = 'LSP: Show Diagnostics' })
        end,
      })

      -- Auto-format C# on save
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.cs',
        callback = function(args)
          vim.lsp.buf.format({ bufnr = args.buf, async = false, timeout_ms = 2000 })
        end,
        desc = 'Format C# files on save',
      })

      -- Setup all installed servers
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
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
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

