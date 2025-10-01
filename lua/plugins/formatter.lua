-- lua/plugins/formatter.lua


return {
  {
    "MunifTanjim/prettier.nvim",
    event = "BufReadPre",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local prettier = require("prettier")

      -- Define filetypes you want Prettier to handle
      local prettier_filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      }

      prettier.setup({
        bin = "prettier", -- or `prettierd`
        filetypes = prettier_filetypes,
        format_on_save = {
          enabled = false, -- disable plugin's built-in on_save
        },
      })

      -- Autocmd for formatting
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("PrettierFormat", { clear = true }),
        pattern = "*",
        callback = function(args)
          local filetype = vim.bo[args.buf].filetype
          -- Check against our local table instead of prettier.config
          if vim.tbl_contains(prettier_filetypes, filetype) then
            vim.lsp.buf.format({
              name = "prettier",
              async = false,
              bufnr = args.buf,
            })
          end
        end,
        desc = "Format file with Prettier on save.",
      })

      -- Keymap for manual formatting
      vim.keymap.set("n", "<leader>fp", function()
        vim.lsp.buf.format({ name = "prettier" })
      end, { desc = "Format with Prettier" })
    end,
  },
}

