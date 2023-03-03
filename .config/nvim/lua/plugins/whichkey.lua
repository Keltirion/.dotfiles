local wk = require("which-key")

-- File operations
wk.register({
    f = {
        name = "File",
        f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format file" },
        s = { function() require("telescope.builtin").find_files() end, "Search for file in project" },
    },
}, { prefix = "<leader>" })

-- Main page
wk.register({
    w = { "<cmd>w<cr>", "Save file" },
    q = { "<cmd>bd<cr>", "Close current buffer" },
    y = { [["+y]], "Copy to system clipboard" },
    ["/"] = { "<cmd>CommentToggle<cr>", "Toggle comment" },
}, { prefix = "<leader>" })

-- Main page visual
wk.register({
    ["/"] = { "<cmd>CommentToggle<cr>", "Toggle comment" },
}, { prefix = "<leader>", mode = "v" })

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

-- Buffers
wk.register({
    b = {
        name = "Buffers",
        n = { "<cmd>bn<cr>", "Next buffer" },
        p = { "<cmd>bp<cr>", "Previous buffer" },
        q = { "<cmd>bd<cr>", "Close buffer" },
        l = { "<cmd>Telescope buffers<cr>", "List buffers" },
    },
}, { prefix = "<leader>" })

-- Explorer
wk.register({
    e = {
        name = "Explorer",
        e = { "<cmd>NvimTreeFocus<cr>", "Explore files" },
        q = { "<cmd>NvimTreeClose<cr>", "Close terminal" },
        c = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "Explore file dir" },
    },
}, { prefix = "<leader>" })

-- Terminal
wk.register({
    t = {
        name = "Terminal",
        t = { "<cmd>terminal<cr>", "Start a new terminal" },
        q = { "<cmd>bd!<cr>", "Close terminal" },
    },
}, { prefix = "<leader>" })

-- Git
wk.register({
    g = {
        name = "Git",
        l = { "<cmd>LazyGitCurrentFile<cr>", "Start lazygit" },
    },
}, { prefix = "<leader>" })

wk.register({
    p = {
        name = "Packer",
        s = { "<cmd>PackerSync<cr>", "Packer sync" },
    },
}, { prefix = "<leader>" })
