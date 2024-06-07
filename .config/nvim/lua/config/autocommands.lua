vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost" }, {
	callback = function ()
		local winbar_filetype_exclude = {
			"neo-tree"
		}

		if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then

			vim.opt_local.winbar = nil
			return
		end

	end
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = { "*LazyGit*" },
	group = vim.api.nvim_create_augroup("git_refresh_neotree", {clear = true}),
	callback = function()
		require("neo-tree.sources.filesystem.commands").refresh(
			require("neo-tree.sources.manager").get_state("filesystem")
		)
	end,
})
