require('nvim-treesitter.configs').setup {
	auto_install = false,

	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil
	}
}
