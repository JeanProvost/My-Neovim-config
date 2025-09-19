-- LSP restart auto cmd
local lsp_restart_augroup = vim.api.nvim_create_augroup('LspRestartOnChange', { clear = true })

vim.api.nvim_create_autocmd({ 'BufWritePost', 'FileChangedShellPost' }, {
  group = lsp_restart_augroup,
  pattern = '*.csproj',
  desc = 'Restart C# LSP client on project file changes.',
  command = 'LspRestart',
})

local augroup = vim.api.nvim_create_augroup('CustomIndent', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = '*',
  callback = function()
    local filetype = vim.bo.filetype
    local indent = 4 -- default indent

    if filetype == 'cs' then
      indent = 4
    else 
      indent = 2
    end

    -- Settings for current buffer
    vim.bo.shiftwidth = indent
    vim.bo.tabstop = indent
    vim.bo.softtabstop = indent
    vim.bo.expandtab = true
  end,
})
