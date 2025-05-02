vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost" }, {
	callback = function()
		local winbar_filetype_exclude = {
			"neo-tree"
		}

		if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
			vim.opt_local.winbar = nil
			return
		end
	end
})

