local cmp = require("cmp")
local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({

	-- ... Your other configuration ...
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp', keyword_length = 1 },
		{ name = 'luasnip', keyword_length = 2 },
		{ name = 'buffer', keyword_length = 3 },
	},

	formatting = {
		fields = { 'kind', 'abbr', 'menu' }
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),

		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),

		['<Tab>'] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1

			if cmp.visible() then
				cmp.select_next_item(select_opts)
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, { 'i', 's' }),
	}),
	['<S-Tab>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item(select_opts)
		else
			fallback()
		end
	end, { 'i', 's' }),

})
