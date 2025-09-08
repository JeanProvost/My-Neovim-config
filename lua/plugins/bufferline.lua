return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	opts = {
		options = {
			-- Use powerline-style separators
			separators_style = "arrow",
			-- Show diagnostics (errors/warnings)
			diagnostics = "nvim_lsp",
			-- Show buffer numbers
			numbers = "buffer_id",
			-- Click to close buffer
			right_mouse_button_remaps = {
				close_buffer = "BufDel",
			},
		}
	}
}
