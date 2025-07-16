require("nvim-tree").setup({
  view = {
    width = 35,
    side = "left",
    preserve_window_proportions = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
  },
})
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

