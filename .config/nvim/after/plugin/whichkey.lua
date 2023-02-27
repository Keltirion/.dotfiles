local wk = require("which-key")

-- File operations
wk.register({
    f = {
        name = "File",
        f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format file" },
        s = { function() require("telescope.builtin").find_files() end, "Search for file in project" },
    },
}, { prefix = "<leader>" })

-- Harpoon
wk.register({
    h = {
        name = "Harpoon",
        ["1"] = { function() require("harpoon.ui").nav_file(1) end, "Swap to first mark" },
        ["2"] = { function() require("harpoon.ui").nav_file(2) end, "Swap to second mark" },
        ["3"] = { function() require("harpoon.ui").nav_file(3) end, "Swap to second mark" },
        ["4"] = { function() require("harpoon.ui").nav_file(4) end, "Swap to second mark" },
        h = { function() require("harpoon.mark").add_file() end, "Mark file" },
        u = { function() require("harpoon.ui").toggle_quick_menu() end, "Show ui" },
    },
}, { prefix = "<leader>" })

-- Other
wk.register({
    w = { "<cmd>w<cr>", "Save file" },
    q = { "<cmd>w<cr>", "Close" },
    y = { [["+y]], "Copy to system clipboard" },
}, { prefix = "<leader>" })
