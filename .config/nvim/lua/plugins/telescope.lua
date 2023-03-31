local builtin = require('telescope.builtin')

require('telescope').setup{}

vim.keymap.set('n', '<C-p', builtin.git_files, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("grep > ") });
end)

require'telescope'.load_extension('project')
