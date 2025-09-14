vim.g.mapleader = " "

-- Git
vim.keymap.set("n", "<leader>gs", ":G<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Git diff open" })
vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "Git diff close" })
vim.keymap.set("n", "<leader>gD", ":DiffviewOpen origin/HEAD...<CR>", { desc = "Git diff: working tree vs remote tracking branch" })
vim.keymap.set("n", "<leader>gb", ":G blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gl", ":G log<CR>", { desc = "Git log" })
vim.keymap.set("n", "<leader>ga", ":Git add %<CR>", { desc = "Git add current file" })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gP", ":Git pull<CR>", { desc = "Git pull" })
vim.keymap.set("n", "]h", function() require("gitsigns").next_hunk() end, { desc = "Next Git hunk" })
vim.keymap.set("n", "[h", function() require("gitsigns").prev_hunk() end, { desc = "Previous Git hunk" })
vim.keymap.set("n", "<leader>hs", function() require("gitsigns").stage_hunk() end, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hr", function() require("gitsigns").reset_hunk() end, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>hp", function() require("gitsigns").preview_hunk() end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gS", ":Gwrite<CR>", { desc = "Stage current buffer" })
vim.keymap.set("n", "<leader>gR", ":Gread<CR>", { desc = "Discard changes in buffer" })


-- File navigation
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "File tree" })
vim.keymap.set("n", "<leader>fw", ":Telescope grep_string<CR>", { desc = "Search word under cursor" })
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Live grep project" })

-- Clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy to clipboard" })
vim.keymap.set('n', '<leader>cp', ':let @+ = expand("%:p")<CR>', { desc = "Copy full file path" })

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tl", ":tablast<CR>", { desc = "Last tab" })
vim.keymap.set("n", "<leader>tf", ":tabfirst<CR>", { desc = "First tab" })

-- Copilot
vim.keymap.set("i", "<C-l>", function()
  require("copilot.suggestion").accept()
end, { desc = "Copilot: Accept suggestion" })

vim.keymap.set("i", "<M-]>", function()
  require("copilot.suggestion").next()
end, { desc = "Copilot: Next suggestion" })

vim.keymap.set("i", "<M-[>", function()
  require("copilot.suggestion").prev()
end, { desc = "Copilot: Previous suggestion" })

vim.keymap.set("i", "<C-]>", function()
  require("copilot.suggestion").dismiss()
end, { desc = "Copilot: Dismiss suggestion" })

vim.keymap.set("n", "<leader>cr", ":CopilotChatReset<CR>", { desc = "Copilot Chat: Reset session" })
vim.keymap.set("n", "<leader>cc", ":CopilotChatClose<CR>", { desc = "Copilot Chat: Close Panel" })
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

