vim.g.mapleader = " "
vim.keymap.set("n", "<leader>gs", ":G<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Git diff" })
vim.keymap.set("n", "<leader>gb", ":G blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gl", ":G log<CR>", { desc = "Git log" })
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "File tree" })
vim.keymap.set("n", "<leader>fw", ":Telescope grep_string<CR>", { desc = "Search word under cursor" })
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Live grep project" })

