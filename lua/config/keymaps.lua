vim.g.mapleader = " "

-- Git
vim.keymap.set("n", "<leader>gs", ":G<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Git diff" })
vim.keymap.set("n", "<leader>gb", ":G blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gl", ":G log<CR>", { desc = "Git log" })

-- File navigation
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "File tree" })
vim.keymap.set("n", "<leader>fw", ":Telescope grep_string<CR>", { desc = "Search word under cursor" })
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Live grep project" })

-- Clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy to clipboard" })

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

