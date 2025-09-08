return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
  },
  config = function()
  --Disable netrw, the default file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Set options for the editor
    vim.opt.termguicolors = true
    vim.opt.number = true
    vim.opt.autoindent = true
    vim.cmd("filetype plugin indent on")
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.expandtab = true

    -- Setup nvim-tree
    require('nvim-tree').setup({
      view = {
        width = 30,
        adaptive_size = true,
      },
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
      renderer = {
        icons = {
          show = {
            git = true,
          },
        },
      },
    })

    -- Autocommand to open the tree on startup
    local function open_nvim_tree(data)
      local directory = vim.fn.isdirectory(data.file) == 1
      if not directory then
        return
      end

      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end,
}
