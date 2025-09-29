-- lua/plugins/formatter.lua

return {
  {
    "MunifTanjim/prettier.nvim",
    -- Load this plugin on the first file open
    event = "BufReadPre",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local prettier = require("prettier")

      prettier.setup({
        -- This will automatically run Prettier on save
        bin = 'prettier', -- or `prettierd`
        filetypes = {
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
        },
        -- We will use an autocommand to run this on save.
        -- We disable the built-in format on save to have more control.
        format_on_save = {
          enabled = false,
        },
      })

      -- Create an autocommand to run Prettier on save for supported filetypes
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("PrettierFormat", { clear = true }),
        pattern = "*", -- Run for all files
        callback = function(args)
          -- Only run for filetypes that Prettier is configured for
          local filetype = vim.bo[args.buf].filetype
          if prettier.config.filetypes[filetype] then
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
