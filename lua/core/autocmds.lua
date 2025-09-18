-- LSP restart auto cmd
local lsp_restart_augroup = vim.api.nvim_create_augroup('LspRestartOnChange', { clear = true })

vim.api.nvim_create_autocmd({ 'BufWritePost', 'FileChangedShellPost' }, {
  group = lsp_restart_augroup,
  pattern = '*.csproj',
  desc = 'Restart C# LSP client on project file changes.',
  command = 'LspRestart',
})
