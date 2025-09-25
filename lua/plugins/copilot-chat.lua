-- lua/plugins/copilot-chat.lua

return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    version = '*',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
      window = {
        layout = 'vertical',
        position = 'right',
        width = 0.25,
      },
    },

    keys = {
      {
        "<leader>cc",
        "<cmd>CopilotChatToggle<cr>",
        desc = "CopilotChat - Toggle Chat",
      },

      -- Ask about the entire workspace
      {
        "<leader>ca",
        function()
          require("CopilotChat").ask(vim.fn.input("Ask Copilot about the workspace: "), { selection = "@workspace" })
        end,
        desc = "CopilotChat - Ask about workspace",
      },
      -- Explain selected code
      {
        "<leader>ce",
        "<cmd>CopilotChatExplain<cr>",
        mode = "v",
        desc = "CopilotChat - Explain selected code",
      },
      -- Ask about specific files
      {
        "<leader>cf",
        function()
          require("CopilotChat").ask(vim.fn.input("Ask Copilot about files: "), { selection = "@files" })
        end,
        desc = "CopilotChat - Ask about files",
      },
    },
  },
}
