-- lua/plugins/copilot-chat.lua

return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main', -- Use the canary branch for the latest features
    dependencies = {
      { 'github/copilot.vim' }, -- The official Copilot runtime
      { 'nvim-lua/plenary.nvim' }, -- Useful library for Neovim plugins
    },
    opts = {
      -- No specific options needed to get started, but you can customize here
      -- For example, to use a vertical split instead of a horizontal one:
      -- window = {
      --   layout = 'vertical',
      -- },
    },
    -- Example keymaps
    keys = {
      {
        "<leader>ca",
        function()
          -- Ask a question about the current buffer's code
          local input = vim.fn.input("Ask Copilot about the current file: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { buffer = "#current" })
          end
        end,
        desc = "CopilotChat - Ask about current file",
      },
      {
        "<leader>cA",
        function()
          -- Ask a question about the entire workspace
          local input = vim.fn.input("Ask Copilot about the workspace: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = "@workspace" })
          end
        end,
        desc = "CopilotChat - Ask about workspace",
      },
      {
        "<leader>ce",
        "<cmd>CopilotChatExplain<cr>",
        mode = "v",
        desc = "CopilotChat - Explain selected code",
      },
    },
  },
}
