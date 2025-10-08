
return {
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        mux = {
          backend = "",
          enabled = false,
        },
      },
    },
    keymaps = {
      {
        "<Esc><Esc>",
        function()
          require("sidekick.cli").hide()
        end,
        desc = "Hide Sidekick",
        mode = { "n", "v" },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").next_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-.>",
        function()
          require("sidekick.cli").focus()
        end,
        desc = "Sidekick Switch Focus",
        mode = { "n", "v" },
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle({ focus = true })
        end,
        desc = "Sidekick Toggle CLI",
        mode = { "n", "v" },
      },
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Claude Toggle",
        mode = { "n", "v" },
      },
      {
        "<leader>ag",
        function()
          require("sidekick.cli").toggle({ name = "gemini", focus = true })
        end,
        desc = "Sidekick Gemini Toggle",
        mode = { "n", "v" },
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").select_prompt()
        end,
        desc = "Sidekick Ask Prompt",
        mode = { "n", "v" },
      },
    },
    config = function(_, opts)
      require("sidekick").setup(opts)

      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "*sidekick*",
        callback = function()
          local map_opts = { noremap = true, silent = true, buffer = 0 }
          vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], map_opts)
          vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], map_opts)
          vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], map_opts)
          vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], map_opts)
          vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], map_opts)
        end,
      })
    end,
  },
}

