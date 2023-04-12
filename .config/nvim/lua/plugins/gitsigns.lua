require('gitsigns').setup {
	signs = {
		add          = { text = '+' },
		change       = { text = '│' },
		delete       = { text = '-' },
		topdelete    = { text = '‾' },
		changedelete = { text = '~' },
		untracked    = { text = '┆' },
	},
	current_line_blame = false,
  current_line_blame_opts = {
		virt_text_pos = 'right_align',
    delay = 1,
  },
}
